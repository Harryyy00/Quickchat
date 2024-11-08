import { ObjectId } from "mongodb";
import { RegisterUserDto } from "../../core/dto/Auth/RegisterUser.dto";
import { ErrorResponse } from "../../core/entity/ErrorRespose.entity";
import { UserRepository } from "../../core/repository/User/UserRepository";
import { Either } from "../../utils/Either";
import { User } from "../../core/entity/User.entity";

export class GetUserUsecase {
  constructor(private userRepository: UserRepository) {}

  async execute({
    user,
  }: {
    user: ObjectId;
  }): Promise<Either<ErrorResponse, User>> {
    const result = await this.userRepository.getUser(user);
    return result;
  }
}
