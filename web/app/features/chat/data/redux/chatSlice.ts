import { StateStatus } from "@/app/core/types";
import { ConversationDto } from "../dto/Conversation.dto";
import { ConversationsDataDto } from "../dto/ConversationsData.dto";
import { ConversationsDto } from "../dto/Conversations.dto";
import { createAsyncThunk, createSlice, PayloadAction } from "@reduxjs/toolkit";
import { ConversationDataDto } from "@/app/features/chat/data/dto/ConversationData.dto";
import { ChatRepositoryImpl } from "../repositories/chat_repository_impl";
import { ChatRemoteDatasource } from "../datasources/chat_remote_datasource";
import { GetConversationsDto } from "../dto/GetConversations.dto";
import { Observable } from "rxjs";
import { Result } from "@/app/core/result";
import { filterRecipient } from "@/app/core/filterRecipient";
import { GetConversationParamDto } from "../dto/GetConversation.dto";

// datasources
const chatRemoteDatasource = new ChatRemoteDatasource();

// repositories
const chatRepository = new ChatRepositoryImpl(chatRemoteDatasource);

// slices
interface ChatState {
  errorMessage: string | null;
  stateStatus: StateStatus;
  chatStatus: StateStatus;
  isChatSent: boolean;
  conversation: ConversationDataDto | null;
  conversationList: ConversationDto[];
  conversations: ConversationsDataDto | null;
  conversationsList: ConversationsDto[];
  isConversationLoaded: boolean;
  isConversationsLoaded: boolean;
  selectedChatId: string | null;
  selectedChatName: string | null;
  isNewConversation: boolean;
}

// initial
const initialState: ChatState = {
  errorMessage: null,
  stateStatus: StateStatus.INITIAL,
  chatStatus: StateStatus.INITIAL,
  isChatSent: false,
  conversation: null,
  conversationList: [],
  conversations: null,
  conversationsList: [],
  isConversationLoaded: false,
  isConversationsLoaded: false,
  selectedChatId: null,
  selectedChatName: null,
  isNewConversation: false,
};

export const connectChatStream = createAsyncThunk<
  void,
  void,
  { state: { chat: ChatState } }
>("chat/connectChatStream", async (_, { dispatch }) => {
  const resultStream: Observable<Result<ConversationsDto>> =
    chatRepository.connectChatStream();
  resultStream.subscribe({
    next: (message: Result<ConversationsDto>) => {
      console.log(`MESSSS ${message.getValue.content}`);
      dispatch(chatSlice.actions.addConversation(message.getValue));
      return message.getValue;
    },
    error: (error: Result<ConversationsDto>) => {
      dispatch(
        chatSlice.actions.setError(error.getError || "Connection error")
      );
      return error.getError;
    },
  });
});

export const disposeChatStream = createAsyncThunk(
  "chat/disposeChatStream",
  async () => {
    const result = await chatRepository.disposeChatStream();
    if (!result.isSuccess) {
      throw new Error(result.getError);
    }
    return result.getValue;
  }
);

export const getConversation = createAsyncThunk(
  "chat/getConversation",
  async (params: {
    stateStatus: StateStatus;
    getConversationParamDto: GetConversationParamDto;
  }) => {
    console.log(params);

    const result = await chatRepository.getConversation(
      params.getConversationParamDto.page
    );
    if (!result.isSuccess) {
      throw new Error(result.getError);
    }
    return result.getValue;
  }
);

export const sendMessage = createAsyncThunk(
  "chat/sendMessage",
  async (params: { recipient: string; content: string }) => {
    const result = await chatRepository.sendMessage(
      params.recipient,
      params.content
    );
    if (!result.isSuccess) {
      throw new Error(result.getError);
    }
    return result.getValue;
  }
);

export const getConversations = createAsyncThunk(
  "chat/getConversations",
  async (params: {
    stateStatus: StateStatus;
    getConversationsDto: GetConversationsDto;
  }) => {
    const result = await chatRepository.getConversations(
      params.getConversationsDto.conversationsId,
      params.getConversationsDto.page
    );
    if (!result.isSuccess) {
      throw new Error(result.getError);
    }
    return result.getValue;
  }
);

export const changeChatStatus = createAsyncThunk(
  "chat/changeChatStatus",
  async (_, { dispatch }) => {
    dispatch(chatSlice.actions.changeChatStatus());
  }
);

export const createNewConversation = createAsyncThunk(
  "chat/createNewConversation",
  async (userName: string, { dispatch }) => {
    dispatch(chatSlice.actions.createNewConversation(userName));
  }
);

const chatSlice = createSlice({
  name: "chat",
  initialState,
  reducers: {
    addConversation: (state, action: PayloadAction<ConversationsDto>) => {
      console.log(`watafak${action.payload.recipient}`);
      console.log(`watafak${state.selectedChatName}`);
      const recipient = filterRecipient(
        action.payload.sender,
        action.payload.recipient,
        localStorage.getItem("username")
      );

      if (recipient === state.selectedChatName) {
        state.conversationsList.push(action.payload);
      }

      state.chatStatus = StateStatus.LOADED;
      state.isChatSent = true;
    },
    setError: (state, action: PayloadAction<string>) => {
      state.errorMessage = action.payload;
      state.chatStatus = StateStatus.ERROR;
    },
    changeChatStatus: (state) => {
      state.isChatSent = false;
    },
    createNewConversation: (state, action) => {
      state.selectedChatName = action.payload;
      state.isNewConversation = true;
      state.conversationsList = [];
    },
  },
  extraReducers: (builder) => {
    // getConversation
    builder
      .addCase(getConversation.pending, (state, action) => {
        console.log(
          `action.meta.arg.stateStatus ${action.meta.arg.stateStatus}`
        );
        state.stateStatus = action.meta.arg.stateStatus;
      })
      .addCase(
        getConversation.fulfilled,
        (state, action: PayloadAction<ConversationDataDto>) => {
          state.stateStatus = StateStatus.LOADED;
          state.conversation = action.payload;

          state.conversationList = action.payload.conversationList;
          state.isConversationLoaded = true;
        }
      )
      .addCase(getConversation.rejected, (state, action) => {
        state.stateStatus = StateStatus.ERROR;
        state.errorMessage =
          action.error.message ?? "Failed to load conversation";
      });

    //getConversations
    builder
      .addCase(getConversations.pending, (state, action) => {
        state.stateStatus = action.meta.arg.stateStatus;
      })
      .addCase(getConversations.fulfilled, (state, action) => {
        const page = action.meta.arg.getConversationsDto.page;
        const selectedChatId =
          action.meta.arg.getConversationsDto.conversationsId;
        const selectedChatName = action.meta.arg.getConversationsDto.userName;
        const resultList = action.payload.conversationsList;
        const conversationsDataDto = action.payload;
        const updatedList = getUpdatedList(
          state.conversationsList,
          resultList,
          page
        );

        state.selectedChatId = selectedChatId;
        state.selectedChatName = selectedChatName;
        state.conversations = conversationsDataDto;
        state.conversationsList = updatedList;
        state.isConversationsLoaded = true;

        // reset state
        state.stateStatus = StateStatus.LOADED;
        state.isConversationsLoaded = false;
        state.isNewConversation = false;
      })
      .addCase(getConversations.rejected, (state, action) => {
        state.stateStatus = StateStatus.ERROR;
        state.errorMessage =
          action.error.message ?? "Failed to load conversation";
      });

    //sendMessage
    builder
      .addCase(sendMessage.pending, (state) => {
        state.chatStatus = StateStatus.LOADING;
      })
      .addCase(sendMessage.fulfilled, (state, action) => {
        state.chatStatus = StateStatus.LOADED;
        state.isChatSent = action.payload ?? false;
      })
      .addCase(sendMessage.rejected, (state, action) => {
        state.chatStatus = StateStatus.ERROR;
        state.errorMessage = action.error.message ?? "Failed to send Message";
      });

    // dipose / complete stream
    builder
      .addCase(disposeChatStream.pending, (state) => {
        state.chatStatus = StateStatus.LOADING;
      })
      .addCase(disposeChatStream.fulfilled, (state, action) => {
        state.errorMessage = null;
        state.stateStatus = StateStatus.INITIAL;
        state.chatStatus = StateStatus.INITIAL;
        state.isChatSent = false;
        state.conversation = null;
        state.conversationList = [];
        state.conversations = null;
        state.conversationsList = [];
        state.isConversationLoaded = false;
        state.isConversationsLoaded = false;
        state.selectedChatId = null;
        state.selectedChatName = null;
        state.isNewConversation = false;
      })
      .addCase(disposeChatStream.rejected, (state, action) => {
        state.chatStatus = StateStatus.ERROR;
        state.errorMessage = action.error.message ?? "error during disposing";
      });
  },
});

function getUpdatedList<T>(
  currentList: T[],
  resultList: T[],
  page: number
): T[] {
  const updatedList: T[] = [];

  for (const value of resultList) {
    if (!updatedList.some((item) => item === value)) {
      updatedList.push(value);
    } else {
      const index = updatedList.findIndex((item) => item === value);
      if (index !== 0) {
        updatedList.splice(index, 1, value);
      }
    }
  }

  if (page !== 1) {
    for (const value of currentList) {
      if (!updatedList.some((item) => item === value)) {
        updatedList.push(value);
      }
    }
  }

  return updatedList;
}

export default chatSlice.reducer;
