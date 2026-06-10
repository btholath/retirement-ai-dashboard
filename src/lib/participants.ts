import type { Participant } from "@/src/types/participant";
import data from "@/src/data/participants.json";

function isParticipant(value: unknown): value is Participant {
  if (typeof value !== "object" || value === null) return false;
  const p = value as Record<string, unknown>;
  return (
    typeof p.id === "string" &&
    typeof p.name === "string" &&
    typeof p.age === "number" &&
    typeof p.balance === "number"
  );
}

export function getParticipants(): Participant[] {
  if (!Array.isArray(data)) throw new Error("participants.json must be an array");
  return data.filter(isParticipant);
}
