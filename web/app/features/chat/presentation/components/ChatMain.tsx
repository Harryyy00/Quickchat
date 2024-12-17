import React, { useCallback, useEffect, useRef, useState } from 'react';
import { GetConversationsUsecase } from '../../domain/usecases/getConversations.usecase';
import { useDispatch } from 'react-redux';
import { useAppSelector } from '@/app/core/hooks';
import { StateStatus } from '@/app/core/types';
import { GetConversationsDto } from '../../data/dto/GetConversations.dto';
import { ConnectChatStreamUsecase } from '../../domain/usecases/connectChatStream.usecase';
import { SendMessageUsecase } from '../../domain/usecases/sendMessage.usecase';
import { filterRecipient } from '@/app/core/filterRecipient';


interface ChatMainProps {
  // props
}

export const ChatMain: React.FC<ChatMainProps> = () => {
  const dispatch = useDispatch();

  // Usecases
  const getConversationsUsecase = new GetConversationsUsecase();
  // const connectChatStream = new ConnectChatStreamUsecase();
  const sendMessageUsecase = new SendMessageUsecase()

  // references
  const messagesContainerRef = useRef<HTMLDivElement | null>(null);
  const messageInputRef = useRef<HTMLInputElement | null>(null);

  // local states
  const [isAtTop, setIsAtTop] = useState(false);
  const [message, composeMessage] = useState<string>('');


  // selectors
  const chat = useAppSelector((state) => state.chat);
  const auth = useAppSelector((state => state.auth));
  const { 
    
    selectedChatId,
    selectedChatName,
    conversations,
    conversationsList, 
    conversation,
    conversationList,
    isNewConversation,
  } = chat;
  const { loginDatas } = auth;


  // private methods
  const _getNextPage = useCallback(() => {
    if (!conversationsList) return;

    const currentPage = conversations?.currentPage ?? 0;
    const maxPage = conversations?.maxPage ?? 0;

    // checkjk if more pages are available and a conversationId (selectedChatId) is set
    if (currentPage < maxPage && selectedChatId && selectedChatName) {
      getConversationsUsecase.execute({
        stateStatus: StateStatus.LOADING,
        getConversationsDto: new GetConversationsDto(selectedChatName, selectedChatId, currentPage + 1)
      }, dispatch);
    }
  }, [conversationsList, selectedChatId]);

  const _handleScroll = (e: React.UIEvent<HTMLDivElement>) => {
    const { scrollTop } = e.currentTarget;
    const { scrollHeight, clientHeight } = e.currentTarget;
    const scrollPercentage = (scrollTop / (scrollHeight - clientHeight)) * 100;
    setIsAtTop(scrollPercentage === 0);
    
   
    if (scrollPercentage === 0) {
      console.log('Reached top');
      _getNextPage();
    }
  };

  /// listeners
  // useEffect(() => {
  //   connectChatStream.execute(dispatch)
  // },[dispatch]);

  useEffect(() => {
    console.log(`watda ${selectedChatName}`)
  },[selectedChatName]);

  useEffect(() => {
    if (messagesContainerRef.current) {
      messagesContainerRef.current.scrollTop = messagesContainerRef.current.scrollHeight;
    }
  }, [conversationsList]);

  useEffect(()=> {
    if(conversation !== null){
      const recipient = filterRecipient(
        conversationList[0].sender,
        conversationList[0].recipient,
        localStorage.getItem("username")
      );
      getConversationsUsecase.execute({
        stateStatus: StateStatus.LOADED, 
        getConversationsDto: new GetConversationsDto(recipient, conversationList[0].conversationsId, 1)}, dispatch)
    }
  }, [])

  // useEffect(() => {
  //   document.addEventListener("keydown", function (event: any) {
  //     console.log(`EEEE ${event.keyCode}`)
  //     console.log(`lll ${event.target.nodeName}`)
  //     console.log(`lll ${event.target.id}`)
  //     if (event.keyCode === 13 && event.target.nodeName === "INPUT" && event.target.id === "message-input") {
       
  //       if(message !== '' || message !== undefined || message !== null){
  //         event.preventDefault();
  //         console.log(`selectedChatName ${selectedChatName}`)
  //         if(selectedChatName){
  //           console.log(`message ${message}`)
  //           sendMessageUsecase.execute({recipient: selectedChatName, content: message}, dispatch);
  //           messageInputRef.current!.value  = ''
  //         }  
  //       }
  //     //   var form = event.target.form;
  //     //   var index = Array.prototype.indexOf.call(form, event.target);
  //     //   form.elements[index + 2].focus();
  //     //   event.preventDefault();
  //     }
  //   });
  // }, []);


    return (
      <div className="flex-1 flex flex-col h-screen">
        {/* Chat Header */}
        <div className="p-4 border-b border-gray-200 flex items-center">
          <div className="relative inline-flex items-center justify-center w-10 h-10 rounded-full bg-gray-300 text-black">
            {selectedChatName ? (
              selectedChatName
              .split(' ')
              .map(word => word[0])
              .join('')
              .toUpperCase()
              .slice(0, 2)
            ) : (
              <div></div>
            )}
          </div>
          <div className="ml-3">
            <div className="font-semibold text-black">
              {selectedChatName}
            </div>
            {/* <div className="text-sm text-gray-500">Active now</div> */}
          </div>
        </div>

        {/* Loading indicator when at top */}
        {isAtTop && (
          <div className="p-2 text-center bg-gray-50">
            <div className="inline-flex items-center">
              <svg className="animate-spin h-4 w-4 mr-2 text-red-400" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              <span className='text-black'>
                Loading older messages...
              </span>
            </div>
          </div>
        )}
  
        {/* Messages area */}
        <div 
          ref={messagesContainerRef}
          onScroll={_handleScroll}
          className="flex-1 overflow-y-auto p-4 space-y-4 flex flex-col"
        >
          {/* add a spacer div to push content to bottom initially */}
          <div className="flex-1" />
          
          {conversationsList?.map((conversation, index) => {
            const isMe = conversation.sender === (loginDatas?.user.userName ?? localStorage.getItem("username"));
            const recipient = filterRecipient(conversation.sender, conversation.recipient, localStorage.getItem("username"));
            
            return (
              <div key={index} className="flex flex-shrink-0">
                {isMe ? (
                  // Sent message (align right)
                  <div className="flex items-end justify-end w-full">
                    <div className="bg-red-400 text-white rounded-2xl rounded-br-none p-3 max-w-md">
                      <p>{conversation.content}</p>
                    </div>
                  </div>
                ) : (
                  // Received message (align left)
                  <div className="flex items-end w-full">
                    <div className="relative inline-flex items-center justify-center w-8 h-8 rounded-full bg-red-400 text-white-600" >
                    {
                      recipient
                      .split(' ')
                      .map(word => word[0])
                      .join('')
                      .toUpperCase()
                      .slice(0, 2)
                    }
                    </div>
                    <div className="text-black ml-2 bg-gray-100 rounded-2xl rounded-bl-none p-3 max-w-md">
                      <span className='text-xs text-red-400 font-bold'>{conversation.sender}</span>
                      <p>{conversation.content}</p>
                    </div>
                  </div>
                )}
              </div>
            );
          })}

          {conversationsList.length === 0 ? (
            <div className="flex justify-center items-center h-full text-gray-500">
              {isNewConversation ? (
                <div>
                  Compose a message below to start a conversation
                </div>
              ) : (
                <div>
                  Start a new or select a conversation
                </div>
              )}
              
            </div>
          ) : (
            <div></div>
          )}
        </div>
  
        {/* Input area */}
        <div className="p-4 border-t border-gray-200">
          <div className="flex items-center space-x-2">
            {/* <button className="p-2 hover:bg-gray-100 rounded-full">
              <svg
                className="w-6 h-6 text-gray-500"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M12 6v6m0 0v6m0-6h6m-6 0H6"
                />
              </svg>
            </button> */}
            <input
              type="text"
              placeholder="Compose message..."
              id='message-input'
              className="text-black flex-1 p-2 rounded-full bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
              onChange={(e) => composeMessage(e.target.value)}
              ref={messageInputRef}
            />
            <button 
              className="p-2 text-blue-500 hover:bg-gray-100 rounded-full"
              onClick={(e) => { 
                e.preventDefault();
                console.log(`sele ${selectedChatName}`)
                if(selectedChatName){
                  sendMessageUsecase.execute({recipient: selectedChatName, content: message}, dispatch);
                  messageInputRef.current!.value  = ''
                }  
              }}
            >
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" className="w-5 h-5 fill-current text-red-400">
                <path d="M498.1 5.6c10.1 7 15.4 19.1 13.5 31.2l-64 416c-1.5 9.7-7.4 18.2-16 23s-18.9 5.4-28 1.6L284 427.7l-68.5 74.1c-8.9 9.7-22.9 12.9-35.2 8.1S160 493.2 160 480l0-83.6c0-4 1.5-7.8 4.2-10.8L331.8 202.8c5.8-6.3 5.6-16-.4-22s-15.7-6.4-22-.7L106 360.8 17.7 316.6C7.1 311.3 .3 300.7 0 288.9s5.9-22.8 16.1-28.7l448-256c10.7-6.1 23.9-5.5 34 1.4z"/>\
              </svg>
            </button>
          </div>
        </div>
      </div>
    );
};