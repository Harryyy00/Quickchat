/// [other imports]
import express, { Router } from "express";
import bodyParser from "body-parser";
import dotenv from "dotenv";
import multer from "multer";

/// [middleware imports]
// import { connectToDatabase } from "./middleware/MongoDB";

/// [implementation imports]
// import { UserRepositoryImpl } from "./infastructure/repository/User/UserRepositoryImpl";
// import { CreateUserUsecase } from "./usecase/User/CreateUser.usecase";
// import { UserController } from "./interface/controller/User/UserController";
// import { AuthenticationRepositoryImpl } from "./infastructure/repository/Auth/AuthenticationRepositoryImpl";
// import { LoginUserUsecase } from "./usecase/Auth/LoginUser.usecase";
// import { LoginController } from "./interface/controller/Auth/LoginController";
import { authenticateToken } from "./middleware/AuthenticateToken";
import { ChatController } from "./interface/controller/Chat/ChatController";
import { ChatSseUsecase } from "./usecase/Chat/ChatSse.usecase";
// import { GetConversationUsecase } from "./usecase/Chat/GetConversation.usecase";
// import { GetConversationsUsecase } from "./usecase/Chat/GetConversations.usecase";
import { ChatRepositoryImpl } from "./infastructure/repository/Chat/ChatRepositoryImpl";
// import { GetUserUsecase } from "./usecase/User/GetUser.usecase";
// import { SearchUsersUsecase } from "./usecase/User/SearchUsers.usecase";

/// initialization
dotenv.config();

const app = express();
const port = process.env.PORT;

// Connect to MongoDB
// connectToDatabase().catch(console.error);

/// multer
// const upload = multer({ storage: multer.memoryStorage() });

/// implementations
// const userRepository = new UserRepositoryImpl();
// const authenticationRepository = new AuthenticationRepositoryImpl();
// const chatRepository = new ChatRepositoryImpl();

/// usecases
// const createUserUsecase = new CreateUserUsecase(userRepository);
// const getUserUsecase = new GetUserUsecase(userRepository);
// const searchUsersUsecase = new SearchUsersUsecase(userRepository);
// const loginUserUsecase = new LoginUserUsecase(authenticationRepository);
const chatSseUsecase = new ChatSseUsecase();
// const getConversationUsecase = new GetConversationUsecase(chatRepository);
// const getConversationsUsecase = new GetConversationsUsecase(chatRepository);

/// controllers
// const userController = new UserController(
//   createUserUsecase,
//   getUserUsecase,
//   searchUsersUsecase
// );
// const loginController = new LoginController(loginUserUsecase);
const chatController = new ChatController(
  chatSseUsecase
  // getConversationUsecase,
  // getConversationsUsecase
);

app.use(bodyParser.json());

// Routes
app.get("/", (req, res) => {
  res.send("Welcome to Quick Chat");
});

// Auth Routes
// app.post("/login", (req, res) => loginController.login(req, res));

// User Routes
// app.post("/register", upload.single("profilePicture"), (req, res) =>
//   userController.registerUser(req, res)
// );
// app.get("/getUser/:user", authenticateToken, (req, res) =>
//   userController.getUser(req, res)
// );
// app.post("/search", authenticateToken, (req, res) =>
//   userController.searchUsers(req, res)
// );

/// Chat SSE routes
///
const chatRouter = Router();
app.use("/chat", chatRouter);

chatRouter.get("/events", authenticateToken, (req, res) =>
  chatController.sse(req, res)
);

chatRouter.post("/send", authenticateToken, (req, res) =>
  chatController.sendMessage(req, res)
);

// app.get("/conversation/:page?", authenticateToken, (req, res) =>
//   chatController.getConversation(req, res)
// );

// app.get(
//   "/conversations/:conversationsId?/:page?",
//   authenticateToken,
//   (req, res) => chatController.getConversations(req, res)
// );

// Start server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
