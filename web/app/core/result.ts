export class Result<T> {
  private constructor(
    private readonly value: T | null,
    private readonly error: string | null,
    private readonly success: boolean
  ) {}

  static success<T>(value: T): Result<T> {
    return new Result(value, null, true);
  }

  static failure<T>(error: string): Result<T> {
    return new Result<T>(null, error, false); // Explicitly use Result<T> here
  }

  get isSuccess(): boolean {
    return this.success;
  }

  get getValue(): T {
    if (!this.success || this.value === null) {
      throw new Error("Cannot get value from error result");
    }
    return this.value;
  }

  get getError(): string {
    if (this.success || this.error === null) {
      throw new Error("Cannot get error from success result");
    }
    return this.error;
  }
}
