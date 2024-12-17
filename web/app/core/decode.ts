import { jwtDecode } from "jwt-decode";

export function isTokenValid() {
  const token = localStorage.getItem("access_token") ?? undefined;
  if (!token) return false;

  const decodedToken = jwtDecode(token);
  const currentTime = Math.floor(Date.now() / 1000);

  const isValid = decodedToken.exp! > currentTime;

  return isValid;
}

export function removeToken() {
  localStorage.removeItem("authToken");
}
