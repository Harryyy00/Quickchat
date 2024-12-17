import { useEffect } from 'react';
import { useAppSelector } from '../core/hooks';
import { ChatDetails } from '../features/chat/presentation/components/ChatDetails';
import { ChatsList } from '../features/chat/presentation/components/ChatLists';
import { ChatMain } from '../features/chat/presentation/components/ChatMain';
import { ConnectChatStreamUsecase } from '../features/chat/domain/usecases/connectChatStream.usecase';
import { useDispatch } from 'react-redux';

interface MainPageProps {}

export const MainPage: React.FC<MainPageProps> = () => {
  const dispatch = useDispatch();
  const connectChatStream = new ConnectChatStreamUsecase();

  useEffect(() => {
    connectChatStream.execute(dispatch)
  },[]);
  const chat = useAppSelector((state) => state.chat);
  const { 
    selectedChatName,
  } = chat;
  return (
    <div className="flex w-full min-h-screen bg-white">
      <ChatsList />
      <ChatMain />
      {selectedChatName !== null ? (
        <ChatDetails />
      ) : (
        <div></div>
      )}
        
    </div>
  );
}