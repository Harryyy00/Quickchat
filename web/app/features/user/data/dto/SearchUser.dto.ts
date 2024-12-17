import { StateStatus } from "../../../../core/types";

export class SearchUserDto {
  constructor(
    public stateStatus: StateStatus,
    public querySearch: string,
    public page: number
  ) {}
}
