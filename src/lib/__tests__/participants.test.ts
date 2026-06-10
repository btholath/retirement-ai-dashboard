import { describe, it, expect, vi, beforeEach } from "vitest";

// Mock the JSON import before importing the module under test
vi.mock("@/src/data/participants.json", () => ({
  default: [
    { id: "P1001", name: "John Smith", age: 58, balance: 850000 },
    { id: "P1002", name: "Mary Jones", age: 45, balance: 420000 },
  ],
}));

// Import after mock is registered
const { getParticipants } = await import("../participants");

describe("getParticipants", () => {
  it("returns all valid participants from JSON", () => {
    const result = getParticipants();
    expect(result).toHaveLength(2);
  });

  it("returns participants with correct shape", () => {
    const [first] = getParticipants();
    expect(first).toEqual({
      id: "P1001",
      name: "John Smith",
      age: 58,
      balance: 850000,
    });
  });

  it("filters out entries missing required fields", async () => {
    vi.resetModules();
    vi.doMock("@/src/data/participants.json", () => ({
      default: [
        { id: "P1001", name: "John Smith", age: 58, balance: 850000 },
        { id: "P1002", name: "Mary Jones" }, // missing age and balance
        { name: "No ID", age: 40, balance: 100 }, // missing id
        null,
      ],
    }));
    const { getParticipants: getFresh } = await import("../participants");
    const result = getFresh();
    expect(result).toHaveLength(1);
    expect(result[0].id).toBe("P1001");
    vi.resetModules();
  });

  it("returns participants with correct types", () => {
    const participants = getParticipants();
    for (const p of participants) {
      expect(typeof p.id).toBe("string");
      expect(typeof p.name).toBe("string");
      expect(typeof p.age).toBe("number");
      expect(typeof p.balance).toBe("number");
    }
  });
});
