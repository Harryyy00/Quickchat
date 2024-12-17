import React, { useCallback, useRef, useState } from "react";
import { SearchUserUsecase } from "../../domain/usecases/searchUser.usecase";
import { useAppSelector } from "@/app/core/hooks";
import { SearchUserDto } from "../../data/dto/SearchUser.dto";
import { StateStatus } from "@/app/core/types";
import { useDispatch } from "react-redux";
import { ConversationDto } from "@/app/features/chat/data/dto/Conversation.dto";
import { filterRecipient } from "@/app/core/filterRecipient";
import { GetConversationsUsecase } from "@/app/features/chat/domain/usecases/getConversations.usecase";
import { GetConversationsDto } from "@/app/features/chat/data/dto/GetConversations.dto";
import { CreateNewConversationUsecase } from "@/app/features/chat/domain/usecases/createNewConversation.usecase";
import { LogoutUserUsecase } from "@/app/features/authentication/domain/usecases/logout_user.usecase";
import { DisposeChatStreamUsecase } from "@/app/features/chat/domain/usecases/disposeChatStream.usecase";

interface SearchUserComponentProps {}

export const SearchUserComponent: React.FC<SearchUserComponentProps> = () => {
  const dispatch = useDispatch();
  // usecases
  //
  const searchUserUsecase = new SearchUserUsecase();
  const getConversationsUsecase = new GetConversationsUsecase();
  const createNewConversationUsecase = new CreateNewConversationUsecase();
  const logoutUserUsecase = new LogoutUserUsecase();
  const disposeChatStreamUsecase = new DisposeChatStreamUsecase();

  //selectors
  const user = useAppSelector((state) => state.user);
  const chat = useAppSelector((state) => state.chat);

  // pointers
  const { search, searchList } = user;
  const { conversationList } = chat;

  // references
  const searchInputRef = useRef<HTMLInputElement | null>(null);
  const usersContainerRef = useRef<HTMLDivElement | null>(null);

  // local states
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [isDDOpen, setIsDDOpen] = useState(false);
  const [searchval, setSearchValue] = useState<string>("");
  const [isAtBottom, setIsAtBottom] = useState(false);

  // private methods
  const toggleModal = () => {
    console.log("toggle");
    setIsModalOpen(!isModalOpen);
  };

  const toggleDropDown = () => {
    console.log("toggle");
    setIsDDOpen(!isDDOpen);
  };

  const _getNextPage = useCallback(() => {
    if (!searchList) return;

    const currentPage = search?.currentPage ?? 0;
    const maxPage = search?.maxPage ?? 0;

    if (currentPage < maxPage) {
      searchUserUsecase.execute(
        {
          searchUserDto: new SearchUserDto(
            StateStatus.LOADING,
            searchval,
            currentPage + 1
          ),
        },
        dispatch
      );
    }
  }, [searchList]);

  const _handleScroll = (e: React.UIEvent<HTMLDivElement>) => {
    const { scrollTop } = e.currentTarget;
    const { scrollHeight, clientHeight } = e.currentTarget;
    const scrollPercentage = (scrollTop / (scrollHeight - clientHeight)) * 100;
    setIsAtBottom(scrollPercentage > 95);

    if (scrollPercentage > 95) {
      console.log("Reached bottom");
      _getNextPage();
    }
  };

  const onUserTap = (userName: string) => {
    let existingConversation: ConversationDto | undefined;

    try {
      existingConversation = conversationList.find(
        (conversation: ConversationDto) =>
          conversation.sender === userName ||
          conversation.recipient === userName
      );
    } catch (e) {
      existingConversation = undefined;
    }

    if (existingConversation) {
      const recipient = filterRecipient(
        existingConversation.sender,
        existingConversation.recipient,
        localStorage.getItem("username")
      );
      getConversationsUsecase.execute(
        {
          stateStatus: StateStatus.LOADED,
          getConversationsDto: new GetConversationsDto(
            recipient,
            existingConversation.conversationsId,
            1
          ),
        },
        dispatch
      );
    }

    if (!existingConversation) {
      createNewConversationUsecase.execute({ userName }, dispatch);
    }

    toggleModal();
  };

  return (
    <div className="p-4 border-b border-gray-200">
      <div className="flex flex-row justify-between relative">
        <h2 className="text-2xl font-semibold text-black">Chats</h2>
        <div className="relative">
          <a
            id="dropdownDefaultButton"
            onClick={toggleDropDown}
            className="cursor-pointer"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 512 512"
              className="w-5 h-5 fill-current text-black"
            >
              <path d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z" />
            </svg>
          </a>
          {isDDOpen && (
            <div
              id="dropdown"
              className="absolute right-0 top-full z-10 bg-white divide-y divide-gray-100 rounded-lg shadow-lg border border-black/10 w-44 dark:bg-gray-700"
            >
              <ul
                className="py-2 text-sm text-gray-700 dark:text-gray-200"
                aria-labelledby="dropdownDefaultButton"
              >
                <li>
                  <a
                    onClick={(e) => {
                      logoutUserUsecase.execute(dispatch),
                        disposeChatStreamUsecase.execute(dispatch);
                    }}
                    className="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
                  >
                    Sign out
                  </a>
                </li>
              </ul>
            </div>
          )}
        </div>
      </div>
      <div className="mt-2">
        <button
          onClick={toggleModal}
          className="w-full block text-white bg-red-400 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-red-400 flex items-center justify-center space-x-2"
          type="button"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 512 512"
            className="w-5 h-5 fill-current"
          >
            <path d="M441 58.9L453.1 71c9.4 9.4 9.4 24.6 0 33.9L424 134.1 377.9 88 407 58.9c9.4-9.4 24.6-9.4 33.9 0zM209.8 256.2L344 121.9 390.1 168 255.8 302.2c-2.9 2.9-6.5 5-10.4 6.1l-58.5 16.7 16.7-58.5c1.1-3.9 3.2-7.5 6.1-10.4zM373.1 25L175.8 222.2c-8.7 8.7-15 19.4-18.3 31.1l-28.6 100c-2.4 8.4-.1 17.4 6.1 23.6s15.2 8.5 23.6 6.1l100-28.6c11.8-3.4 22.5-9.7 31.1-18.3L487 138.9c28.1-28.1 28.1-73.7 0-101.8L474.9 25C446.8-3.1 401.2-3.1 373.1 25zM88 64C39.4 64 0 103.4 0 152L0 424c0 48.6 39.4 88 88 88l272 0c48.6 0 88-39.4 88-88l0-112c0-13.3-10.7-24-24-24s-24 10.7-24 24l0 112c0 22.1-17.9 40-40 40L88 464c-22.1 0-40-17.9-40-40l0-272c0-22.1 17.9-40 40-40l112 0c13.3 0 24-10.7 24-24s-10.7-24-24-24L88 64z" />
          </svg>
          <span>Start a Chat</span>
        </button>

        {isModalOpen && (
          <div className="fixed inset-0 z-50 flex justify-center items-center overflow-x-hidden overflow-y-auto outline-none focus:outline-none">
            {/* Backdrop */}
            <div
              onClick={toggleModal}
              className="fixed inset-0 z-40 bg-black opacity-50"
            ></div>

            {/* Modal Content */}
            <div className="relative z-50 w-auto max-w-md mx-auto my-6">
              <div className="relative bg-white rounded-lg shadow-lg dark:bg-gray-700">
                <div className="p-6">
                  <form className="max-w-md mx-auto p-1">
                    <label
                      htmlFor="default-search"
                      className="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white"
                    >
                      Search
                    </label>
                    <div className="relative">
                      <div className="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                        <svg
                          className="w-4 h-4 text-gray-500 dark:text-gray-400"
                          aria-hidden="true"
                          xmlns="http://www.w3.org/2000/svg"
                          fill="none"
                          viewBox="0 0 20 20"
                        >
                          <path
                            stroke="currentColor"
                            strokeLinecap="round"
                            strokeLinejoin="round"
                            strokeWidth="2"
                            d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"
                          />
                        </svg>
                      </div>
                      <input
                        type="search"
                        id="default-search"
                        className="block w-full p-4 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white"
                        placeholder="Search Users"
                        required
                        onChange={(e) => setSearchValue(e.target.value)}
                        ref={searchInputRef}
                      />
                      <button
                        type="submit"
                        className="text-white absolute end-2.5 bottom-2.5 bg-red-400 font-medium rounded-lg text-sm px-4 py-2 dark:bg-red-400"
                        onClick={(e) => {
                          e.preventDefault();
                          searchUserUsecase.execute(
                            {
                              searchUserDto: new SearchUserDto(
                                StateStatus.LOADING,
                                searchval,
                                1
                              ),
                            },
                            dispatch
                          );
                        }}
                      >
                        Search
                      </button>
                    </div>
                  </form>

                  {/* Scrollable List */}
                  <div
                    // key={}
                    ref={usersContainerRef}
                    onScroll={_handleScroll}
                    className="max-h-64 overflow-y-auto"
                  >
                    {searchList
                      .filter(
                        (name) =>
                          name.userName !== localStorage.getItem("username")
                      )
                      .map((e, index) => (
                        <div
                          key={index}
                          className="flex items-center space-x-4 p-3 hover:bg-gray-100 cursor-pointer rounded-lg"
                          onClick={(x) => {
                            x.preventDefault(), onUserTap(e.userName);
                          }}
                        >
                          <div className="relative inline-flex items-center justify-center w-10 h-10 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                            <span className="font-bold text-gray-600 dark:text-gray-300">
                              {e.userName
                                .split(" ")
                                .map((word) => word[0])
                                .join("")
                                .toUpperCase()
                                .slice(0, 2)}
                            </span>
                          </div>
                          <div className="flex-1 min-w-0">
                            <p className="text-sm font-medium text-gray-900 truncate dark:text-white">
                              {e.name}
                            </p>
                            <p className="text-sm text-gray-500 truncate dark:text-gray-400">
                              {e.userName}
                            </p>
                          </div>
                        </div>
                      ))}

                    {user.stateStatus == StateStatus.LOADING ? (
                      <div className="flex justify-center items-center h-full">
                        <svg
                          className="animate-spin h-4 w-4 mr-2 text-red-400"
                          xmlns="http://www.w3.org/2000/svg"
                          fill="none"
                          viewBox="0 0 24 24"
                        >
                          <circle
                            className="opacity-25"
                            cx="12"
                            cy="12"
                            r="10"
                            stroke="currentColor"
                            strokeWidth="4"
                          ></circle>
                          <path
                            className="opacity-75"
                            fill="currentColor"
                            d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                          ></path>
                        </svg>
                      </div>
                    ) : (
                      <div></div>
                    )}
                  </div>
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};
