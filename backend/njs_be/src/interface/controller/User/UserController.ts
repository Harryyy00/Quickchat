import { Request, Response } from "express";
import Joi from "joi";
import { CreateUserUsecase } from "../../../usecase/User/CreateUser.usecase";
import { Either, isRight, unwrapEither } from "../../../utils/Either";
import { ErrorResponse } from "../../../core/entity/ErrorRespose.entity";
import objectId from "../../../utils/ObjectId";
import { User } from "../../../core/entity/User.entity";
import { GetUserUsecase } from "../../../usecase/User/GetUser.usecase";
import { SearchUsersUsecase } from "../../../usecase/User/SearchUsers.usecase";
import { UsersResultDto } from "../../../core/dto/User/UsersResult.dto";

export class UserController {
  constructor(
    private createUserUsecase: CreateUserUsecase,
    private getUserUsecase: GetUserUsecase,
    private searchUsersUsecase: SearchUsersUsecase
  ) {}

  async registerUser(req: Request, res: Response): Promise<void> {
    // Validate the body parameters
    const bodySchema = Joi.object({
      name: Joi.string().required(),
      userName: Joi.string().required(),
      password: Joi.string().min(8).max(30).required(),
      repeatPassword: Joi.any()
        .equal(Joi.ref("password"))
        .required()
        .label("repeatPassword")
        .options({ messages: { "any.only": "{{#label}} does not match" } }),
    });

    // Validate the file input
    const fileSchema = Joi.object({
      profilePicture: Joi.binary(),
    });

    // Validate body and file separately
    const { value: bodyVal, error: bodyErr } = bodySchema.validate(req.body);
    const { value: fileVal, error: fileErr } = fileSchema.validate({
      profilePicture: req.file?.buffer!, // Use buffer for binary data
    });

    const error = fileErr || bodyErr;

    if (error) {
      res.status(400).json({ errors: { message: error.details[0].message } });
      return;
    }

    try {
      // Execute the use case for creating a user
      const result: Either<ErrorResponse, string> =
        await this.createUserUsecase.execute({
          name: bodyVal.name,
          userName: bodyVal.userName,
          password: bodyVal.password,
          profilePicture: fileVal.profilePicture, // Store the buffer for later upload
        });

      // Handle result and response
      if (isRight(result)) {
        const data = unwrapEither(result);
        res.status(201).send({ data: { message: data } });
        return;
      }

      const error = unwrapEither(result);
      res.status(error.statusCode).send({ errors: error });
    } catch (err) {
      console.error(err);
      res.status(500).send({ message: "Internal server error" });
    }
  }

  async getUser(req: Request, res: Response): Promise<void> {
    const schema = Joi.object({
      user: objectId.objectId().required(),
    });

    const { value, error } = schema.validate(req.params);

    let result: Either<ErrorResponse, User>;

    if (error) {
      res.status(400).json({ errors: { message: error.details[0].message } });
      return;
    } else {
      result = await this.getUserUsecase.execute({
        user: value.user,
      });

      if (isRight(result)) {
        const data = unwrapEither(result);
        res.status(200).send({ data: data });
        return;
      }

      const error = unwrapEither(result);
      res.status(error.statusCode).send({ errors: error });
    }
  }

  async searchUsers(req: Request, res: Response): Promise<void> {
    const schema = Joi.object({
      searchQuery: Joi.string().required(),
      page: Joi.number().required(),
    });

    const { value, error } = schema.validate(req.body);

    let result: Either<ErrorResponse, UsersResultDto>;

    if (error) {
      res.status(400).json({ errors: { message: error.details[0].message } });
      return;
    } else {
      result = await this.searchUsersUsecase.execute({
        searchQuery: value.searchQuery,
        page: value.page,
      });

      if (isRight(result)) {
        const data = unwrapEither(result);
        res.status(200).send({ data: data });
        return;
      }

      const error = unwrapEither(result);
      res.status(error.statusCode).send({ errors: error });
    }
  }
}
