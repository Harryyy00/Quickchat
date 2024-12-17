import { useAppSelector } from '@/app/core/hooks';
import React from 'react';

interface ChatDetailsProps {
  // Add props as needed
}

export const ChatDetails: React.FC<ChatDetailsProps> = () => {
  // Selectors
  const chat = useAppSelector((state) => state.chat);
  
  const { 
    selectedChatName,
  } = chat;

  return (
    <div className="w-80 border-l border-gray-200 h-screen overflow-y-auto">
      <div className="p-4 text-center border-b border-gray-200">
        <div className="relative inline-flex items-center justify-center w-20 h-20 rounded-full bg-gray-300 mx-auto text-xl text-black">
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
        <h2 className="mt-2 font-semibold text-xl text-black">
          {selectedChatName}
        </h2>
        {/* <p className="text-gray-500">Active now</p> */}
      </div>

      <div className="p-4">
        <div className="space-y-4">
          <div>
            <h3 className="text-gray-400 text-sm font-medium mb-2">This user has yet no info</h3>
            {/* <button className="w-full text-left p-2 hover:bg-gray-100 rounded-lg">
              Change Theme
            </button>
            <button className="w-full text-left p-2 hover:bg-gray-100 rounded-lg">
              Change Emoji
            </button> */}
          </div>

          {/* <div>
            <h3 className="text-gray-500 text-sm font-medium mb-2">Privacy & Support</h3>
            <button className="w-full text-left p-2 hover:bg-gray-100 rounded-lg">
              Mute Notifications
            </button>
            <button className="w-full text-left p-2 hover:bg-gray-100 rounded-lg">
              Search in Conversation
            </button>
            <button className="w-full text-left p-2 hover:bg-gray-100 rounded-lg text-red-500">
              Block User
            </button>
          </div> */}
        </div>
      </div>
    </div>
  );
};