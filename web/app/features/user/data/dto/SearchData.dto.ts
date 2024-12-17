import { UserDataDto } from "@/app/features/authentication/data/dto/UserData.dto";

export class SearchDataDto {
  constructor(
    public currentPage: number,
    public maxPage: number,
    public users: UserDataDto[]
  ) {}
}
