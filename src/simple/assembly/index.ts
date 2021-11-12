import { storage, Context, PersistentVector } from "near-sdk-as"

let tickets = new PersistentVector<string>("m");

const TOTAL_TICKET_COUNT = 100;

export function getRemainingTicketCount(): i32 {
  return TOTAL_TICKET_COUNT - tickets.length;
}

export function hasSignedUp(): boolean {
  for (let i = 0; i < tickets.length; i++) {
    if (tickets[i] == Context.sender) {
      return true;
    }
  }
  return false;
}

export function signUp(): string {
  if (hasSignedUp()) {
    return "already_signed_up";
  }
  if (getRemainingTicketCount() === 0) {
    return "event_sold_out";
  }
  tickets.push(Context.sender);
  return "success";
}