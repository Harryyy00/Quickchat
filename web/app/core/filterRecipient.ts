export function filterRecipient(
  sender: string,
  recipient: string,
  currentUserName: string | null
) {
  //   console.log(`comapre ${sender} : ${recipient} : ${currentUserName}`);
  return sender === recipient
    ? recipient
    : [sender, recipient].filter((name) => name !== currentUserName)[0];
}
