import { ErrorResponse } from "../../core/entity/ErrorRespose.entity";
import { UserRepository } from "../../core/repository/User/UserRepository";
import { Either } from "../../utils/Either";
import { UsersResultDto } from "../../core/dto/User/UsersResult.dto";

export class SearchUsersUsecase {
  constructor(private userRepository: UserRepository) {}

  async execute({
    searchQuery,
    page,
  }: {
    searchQuery: string;
    page: number;
  }): Promise<Either<ErrorResponse, UsersResultDto>> {
    const result = await this.userRepository.searchUsers(searchQuery, page);
    return result;
  }
}
