import { useAppDispatch } from "@/app/core/hooks";
import { setSegment } from "../../data/redux/segmentSlice";

export class SetSegmentUsecase {
  dispatch = useAppDispatch();
  async execute({ segment }: { segment: string }): Promise<void> {
    this.dispatch(setSegment(segment));
  }
}
