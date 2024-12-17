import { SearchUserDto } from "../../data/dto/SearchUser.dto";
import { search } from "../../data/redux/userSlice";

export class SearchUserUsecase {
  async execute(
    {
      searchUserDto,
    }: {
      searchUserDto: SearchUserDto;
    },
    dispatch: any
  ): Promise<void> {
    dispatch(search({ searchUserDto }));
  }
}
