import axiosInstance from "@/app/core/interceptor";
import { ConversationDataDto } from "../dto/ConversationData.dto";
import { config } from "@/app/core/config";
import axios, { AxiosError } from "axios";
import { ConversationsDataDto } from "../dto/ConversationsData.dto";
import { Observable, ReplaySubject, shareReplay } from "rxjs";
import { ConversationsDto } from "../dto/Conversations.dto";
import { fetchEventSource } from "@microsoft/fetch-event-source";
export class ChatRemoteDatasource {
  private eventSource: AbortController | null = null;

  connectChatStream(accessToken: string): Observable<ConversationsDto> {
    return new Observable<ConversationsDto>((observer) => {
      this.eventSource = new AbortController();
      fetchEventSource(`${config.quickChatSSEService}/chat/events`, {
        method: "GET",
        headers: {
          Authorization: `Bearer ${accessToken}`,
          Accept: "text/event-stream",
        },
        signal: this.eventSource.signal,
        onopen: async (response) => {
          if (response.ok) {
            console.log("SSE connection opened.");
          } else {
            observer.error(Error(response.statusText));
          }
        },
        onmessage(event) {
          try {
            const data = JSON.parse(event.data);
            const message: ConversationsDto = {
              sender: data.sender,
              recipient: data.recipient,
              sentAt: data.sentAt,
              content: data.content,
            };
            observer.next(message);
          } catch (error) {
            observer.error("Error parsing message data");
          }
        },

        onerror(error) {
          observer.error("SSE connection error");
          console.error("SSE Error:", error);
        },
        onclose() {
          console.log("SSE connection closed.");
          observer.complete();
        },
      });
      return () => {
        console.log("SSE stream unsubscribed.");
      };
    });
  }

  async disposeChatStream(): Promise<void> {
    if (this.eventSource) {
      console.log("Disposing SSE connection...");

      // Abort the fetch event source
      this.eventSource.abort();
      this.eventSource = null;
    }
  }

  async getConversation(page: number): Promise<ConversationDataDto> {
    try {
      const rawData = {
        page: page,
      };

      const response = await axiosInstance.get<{ data: any }>(
        `${config.quickChatService}/conversation`,
        { params: rawData }
      );

      if (response.status === 200 && response.data?.data) {
        const data = response.data.data;
        return {
          currentPage: data.currentPage,
          maxPage: data.maxPage,
          conversationList: data.conversationList,
        };
      }

      throw new Error("Invalid response format");
    } catch (error) {
      throw new Error(`${error}`);
    }
  }

  async getConversations(
    conversationsId: string,
    page: number
  ): Promise<ConversationsDataDto> {
    try {
      const rawData = {
        conversationsId: conversationsId,
        page: page,
      };

      const response = await axiosInstance.get<{ data: any }>(
        `${config.quickChatService}/conversations`,
        { params: rawData }
      );

      if (response.status === 200 && response.data?.data) {
        const data = response.data.data;
        return {
          currentPage: data.currentPage,
          maxPage: data.maxPage,
          conversationsList: data.conversationsList,
        };
      }

      throw new Error("Invalid response format");
    } catch (error) {
      throw new Error(`${error}`);
    }
  }

  async sendMessage(recipient: string, content: string): Promise<boolean> {
    try {
      const rawData = {
        recipient: recipient,
        content: content,
      };

      const response = await axiosInstance.post<{ data: any }>(
        `${config.quickChatService}/chat/send`,
        rawData
      );

      // trigger sse
      await axiosInstance.post<{ data: any }>(
        `${config.quickChatSSEService}/chat/send`,
        rawData
      );

      if (response.status === 201) {
        return true;
      }

      throw new Error("Invalid response format");
    } catch (error) {
      throw new Error(`${error}`);
    }
  }
}
