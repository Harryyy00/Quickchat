import { Result } from "@/app/core/result";
import { UserRepository } from "../../domain/repositories/user_repository";
import { SearchDataDto } from "../dto/SearchData.dto";
import { SearchUserDto } from "../dto/SearchUser.dto";
import { UserRemoteDatasource } from "../datasources/user_remote_datasource";
export class UserRepositoryImpl implements UserRepository {
  constructor(private readonly userRemoteDatasource: UserRemoteDatasource) {}

  async search(searchUserDto: SearchUserDto): Promise<Result<SearchDataDto>> {
    try {
      const response = await this.userRemoteDatasource.search(searchUserDto);
      return Result.success(response);
    } catch (error) {
      return Result.failure(
        error instanceof Error ? error.message : "Unknown error"
      );
    }
  }
}
