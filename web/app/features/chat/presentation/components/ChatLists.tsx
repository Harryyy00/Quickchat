import React, { useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { useAppSelector } from '@/app/core/hooks';
import { GetConversationUsecase } from '../../domain/usecases/getConversation.usecase';
import { StateStatus } from '@/app/core/types';
import { GetConversationsUsecase } from '../../domain/usecases/getConversations.usecase';
import { GetConversationsDto } from '../../data/dto/GetConversations.dto';
import { filterRecipient } from '@/app/core/filterRecipient';
import { ChangeChatStatusUsecase } from '../../domain/usecases/chageChatStatus.usecase';
import { SearchUserComponent } from '@/app/features/user/presentation/component/SearchUser';
import { GetConversationParamDto } from '../../data/dto/GetConversation.dto';
import { DateUtils } from '@/app/core/dateUtils';

interface ChatsListProps {}

export const ChatsList: React.FC<ChatsListProps> = () => {
  // Usecases
  const getConversationUsecase = new GetConversationUsecase();
  const getConversationsUsecase = new GetConversationsUsecase();
  const changeChatStatusUsecase = new ChangeChatStatusUsecase();
  const dispatch = useDispatch();



  // Selectors
  const chat = useAppSelector((state) => state.chat);
  const auth = useAppSelector((state) => state.auth);
  const { 
    selectedChatName,
    isChatSent
  } = chat;
  

  // Initial fetch and lazy loading
  useEffect(() => {
    getConversationUsecase.execute({stateStatus: StateStatus.LOADING, getConversationParamDto: new GetConversationParamDto(1)}, dispatch);
  }, []);

  ///update every chats
  useEffect(() => {
    getConversationUsecase.execute({stateStatus: StateStatus.LOADING, getConversationParamDto: new GetConversationParamDto(1)}, dispatch);
    changeChatStatusUsecase.execute(dispatch);
  }, [isChatSent]);



  return (
    <div className="h-screen border-r border-gray-200 w-80 flex flex-col">
      <SearchUserComponent/>
      {/* Chat List */}
      <div className="flex-1 overflow-y-auto">
        {chat.stateStatus === StateStatus.LOADING ? (
          <div className="flex justify-center items-center h-full">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-900" />
          </div>
        ) : chat.stateStatus === StateStatus.ERROR ? (
          <div className="flex justify-center items-center h-full text-red-400">
            {chat.errorMessage || 'An error occurred'}
          </div>
        ) : chat.conversationList.length === 0 ? (
          <div className="flex justify-center items-center h-full text-gray-500">
            No conversations yet
          </div>
        ) : (
          chat.conversationList.map((e) => {
            const recipient = filterRecipient(e.sender, e.recipient, localStorage.getItem("username"));
           
            return <div
              key={e.conversationsId}
              className="flex items-center p-3 hover:bg-gray-100 cursor-pointer"
              onClick={(x) => {
                x.preventDefault,
                // console.log(`RECEEEEP ${recipient}`)
                // console.log(`ddddddddf ${selectedChatName}`)
                getConversationsUsecase.execute({
                  stateStatus: StateStatus.LOADED, 
                  getConversationsDto: new GetConversationsDto(
                    recipient,
                    e.conversationsId,
                    1
                  )}, dispatch)}
              }
            >
              <div className="relative inline-flex items-center justify-center w-10 h-10 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                <span className="font-bold text-gray-600 dark:text-gray-300">
                  {
                    recipient
                    .split(' ')
                    .map(word => word[0])
                    .join('')
                    .toUpperCase()
                    .slice(0, 2)
                  }
                </span>
              </div>
              <div className="ml-3 flex-1 min-w-0">
                <div className="flex justify-between items-center">
                  <div className="text-gray-500 font-semibold truncate">
                    {
                      recipient
                    }
                  </div>
                  <div className="text-xs text-gray-500">
                    {DateUtils.formatTimeAgo(e.timeStamp)}
                  </div>
                </div>
                <div className="text-sm text-gray-400 truncate">
                  {e.lastMessage}
                </div>
              </div>
            </div>
          })
        )}
      </div>
    </div>
  );
};
