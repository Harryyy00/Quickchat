import { Result } from "@/app/core/result";
import { SearchDataDto } from "../../data/dto/SearchData.dto";
import { SearchUserDto } from "../../data/dto/SearchUser.dto";

export interface UserRepository {
  search(searchUserDto: SearchUserDto): Promise<Result<SearchDataDto>>;
}
