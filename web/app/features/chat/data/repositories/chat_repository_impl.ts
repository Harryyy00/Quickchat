import { Result } from "@/app/core/result";
import { ChatRepository } from "../../domain/repositories/chat_repository";
import { ConversationDataDto } from "../dto/ConversationData.dto";
import { ChatRemoteDatasource } from "../datasources/chat_remote_datasource";
import { ConversationsDataDto } from "../dto/ConversationsData.dto";
import { Observable, of, shareReplay } from "rxjs";
import { catchError, finalize, map } from "rxjs/operators";
import { ConversationsDto } from "../dto/Conversations.dto";

export class ChatRepositoryImpl implements ChatRepository {
  constructor(private readonly chatRemoteDatasource: ChatRemoteDatasource) {}
  private sharedStream$: Observable<Result<ConversationsDto>> | null = null;
  connectChatStream(): Observable<Result<ConversationsDto>> {
    let accessToken = localStorage.getItem("access_token");
    if (!accessToken) {
      return of(Result.failure<ConversationsDto>("No access token available"));
    }

    return this.chatRemoteDatasource.connectChatStream(accessToken).pipe(
      map((data) => Result.success<ConversationsDto>(data)),
      catchError((error) => of(Result.failure<ConversationsDto>(error.message)))
    );
  }

  async disposeChatStream(): Promise<Result<void>> {
    try {
      this.chatRemoteDatasource.disposeChatStream();
      return Result.success<void>(undefined);
    } catch (error) {
      return Result.failure<void>(
        error instanceof Error ? error.message : "Unknown error"
      );
    }
  }

  async getConversations(
    conversationsId: string,
    page: number
  ): Promise<Result<ConversationsDataDto>> {
    try {
      const response = await this.chatRemoteDatasource.getConversations(
        conversationsId,
        page
      );
      return Result.success(response);
    } catch (error) {
      return Result.failure(
        error instanceof Error ? error.message : "Unknown error"
      );
    }
  }

  async getConversation(page: number): Promise<Result<ConversationDataDto>> {
    try {
      const response = await this.chatRemoteDatasource.getConversation(page);
      return Result.success(response);
    } catch (error) {
      return Result.failure(
        error instanceof Error ? error.message : "Unknown error"
      );
    }
  }

  async sendMessage(
    recipient: string,
    content: string
  ): Promise<Result<boolean>> {
    try {
      const response = await this.chatRemoteDatasource.sendMessage(
        recipient,
        content
      );
      return Result.success(response);
    } catch (error) {
      return Result.failure(
        error instanceof Error ? error.message : "Unknown error"
      );
    }
  }
}
