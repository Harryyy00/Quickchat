import { User } from "../../entity/User.entity";

export class UsersResultDto {
  constructor(
    public currentPage: number,
    public maxPage: number,
    public usersResultList: User[]
  ) {}
}
