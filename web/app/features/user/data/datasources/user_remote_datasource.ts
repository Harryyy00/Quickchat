import axiosInstance from "@/app/core/interceptor";
import { SearchDataDto } from "../dto/SearchData.dto";
import { SearchUserDto } from "../dto/SearchUser.dto";
import { config } from "@/app/core/config";

export class UserRemoteDatasource {
  async search(searchUserDto: SearchUserDto): Promise<SearchDataDto> {
    try {
      const rawData = {
        searchQuery: searchUserDto.querySearch,
        page: searchUserDto.page,
      };

      const response = await axiosInstance.get<{ data: any }>(
        `${config.quickChatService}/search`,
        { params: rawData }
      );

      if (response.status === 200 && response.data?.data) {
        const data = response.data.data;
        return {
          currentPage: data.currentPage,
          maxPage: data.maxPage,
          users: data.users,
        };
      }

      throw new Error("Invalid response format");
    } catch (error) {
      throw new Error(`${error}`);
    }
  }
}
