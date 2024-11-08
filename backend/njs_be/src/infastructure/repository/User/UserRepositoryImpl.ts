import { RegisterUserDto } from "../../../core/dto/Auth/RegisterUser.dto";
import bcrypt from "bcryptjs";
import { UserRepository } from "../../../core/repository/User/UserRepository";
import { getDatabase } from "../../../middleware/MongoDB";
import { ErrorResponse } from "../../../core/entity/ErrorRespose.entity";
import { Either, makeLeft, makeRight } from "../../../utils/Either";
import { Storage } from "megajs";
import { User } from "../../../core/entity/User.entity";
import { ObjectId } from "mongodb";
import { UsersResultDto } from "../../../core/dto/User/UsersResult.dto";

export class UserRepositoryImpl implements UserRepository {
  private userCollection = getDatabase().collection("Users");

  async registerUser(
    newUserData: RegisterUserDto
  ): Promise<Either<ErrorResponse, string>> {
    let errorResponse!: ErrorResponse;

    const existingUser = await this.userCollection.findOne({
      userName: newUserData.userName,
    });

    if (existingUser) {
      errorResponse = {
        statusCode: 400,
        errorMessage: "User already exists, try another username",
      };

      return makeLeft(errorResponse);
    }

    // Upload file to Mega.nz if profilePicture exists
    let profilePictureUrl = null;
    if (newUserData.profilePicture) {
      const storage = new Storage({
        email: process.env.MEGA_EMAIL ?? "",
        password: process.env.MEGA_PASSWORD ?? "",
      });

      await storage.ready;

      // Upload file to Mega.nz
      const uploadStream = storage.upload({
        name: `${newUserData.userName}_profile_picture.jpg`,
        size: newUserData.profilePicture.length,
      });

      uploadStream.write(newUserData.profilePicture);
      uploadStream.end();

      const file = await uploadStream.complete;
      profilePictureUrl = await file.link(true); // Passing 'true' to generate a public link
    }

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(newUserData.password, salt);

    await this.userCollection.insertOne({
      name: newUserData.name,
      userName: newUserData.userName,
      password: hashedPassword,
      profilePictureUrl: profilePictureUrl, // Add the URL here
      profilePictureBlob: newUserData.profilePictureBlob,
      /// auto add this prop for user connection
      requests: [],
      connections: [],
    });
    return makeRight("created");
  }

  async getUser(id: ObjectId): Promise<Either<ErrorResponse, User>> {
    let errorResponse!: ErrorResponse;
    const userDocument = await this.userCollection.findOne({
      _id: new ObjectId(id),
    });

    if (!userDocument) {
      errorResponse = {
        statusCode: 401,
        errorMessage: "User already exist, Try another username",
      };

      return makeLeft(errorResponse);
    }

    const user: User = {
      id: userDocument._id.toString(),
      name: userDocument.name,
      userName: userDocument.userName,
      profilePictureBlob: userDocument.profilePictureBlob,
    };

    return makeRight(user);
  }

  async searchUsers(
    searchQuery: string,
    page: number,
    pageSize: number = 10
  ): Promise<Either<ErrorResponse, UsersResultDto>> {
    let errorResponse!: ErrorResponse;

    try {
      // Fetch users with pagination
      const totalUsers = await this.userCollection.countDocuments({
        userName: { $regex: new RegExp(searchQuery, "i") }, // Case-insensitive search
      });

      const maxPage = Math.ceil(totalUsers / pageSize);

      // If the requested page number exceeds the maximum pages, return an error response
      if (page > maxPage) {
        errorResponse = {
          statusCode: 404,
          errorMessage: "Page number exceeds maximum pages",
        };
        return makeLeft(errorResponse);
      }

      const skip = (page - 1) * pageSize;

      // Fetch paged user list
      const userDocuments = await this.userCollection
        .find({
          userName: { $regex: new RegExp(searchQuery, "i") }, // Case-insensitive search
        })
        .skip(skip)
        .limit(pageSize)
        .toArray();

      if (userDocuments.length === 0) {
        errorResponse = {
          statusCode: 404,
          errorMessage: "No users found with the given username",
        };
        return makeLeft(errorResponse);
      }

      // Map the user documents to the User entity
      const users: User[] = userDocuments.map((userDocument) => ({
        id: userDocument._id.toString(),
        name: userDocument.name,
        userName: userDocument.userName,
        profilePictureBlob: userDocument.profilePictureBlob,
      }));

      const resultDto = new UsersResultDto(page, maxPage, users);

      return makeRight(resultDto);
    } catch (error) {
      errorResponse = {
        statusCode: 500,
        errorMessage: `An error occurred while searching for users: ${error}`,
      };
      return makeLeft(errorResponse);
    }
  }
}
