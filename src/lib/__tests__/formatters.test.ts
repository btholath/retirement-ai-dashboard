import { describe, it, expect } from "vitest";
import { formatCurrency, pluralize } from "../formatters";

describe("formatCurrency", () => {
  it("formats a whole-dollar amount with $ sign and commas", () => {
    expect(formatCurrency(850000)).toBe("$850,000");
  });

  it("formats zero", () => {
    expect(formatCurrency(0)).toBe("$0");
  });

  it("rounds decimals — no cents displayed", () => {
    expect(formatCurrency(1234.99)).toBe("$1,235");
  });

  it("formats small amounts", () => {
    expect(formatCurrency(500)).toBe("$500");
  });

  it("formats negative balances", () => {
    expect(formatCurrency(-10000)).toBe("-$10,000");
  });
});

describe("pluralize", () => {
  it("returns singular when count is 1", () => {
    expect(pluralize(1, "participant")).toBe("participant");
  });

  it("returns default plural (append s) when count is 0", () => {
    expect(pluralize(0, "participant")).toBe("participants");
  });

  it("returns default plural when count is greater than 1", () => {
    expect(pluralize(5, "participant")).toBe("participants");
  });

  it("uses custom plural when provided", () => {
    expect(pluralize(2, "person", "people")).toBe("people");
  });

  it("uses custom plural when count is 1 — returns singular, not custom plural", () => {
    expect(pluralize(1, "person", "people")).toBe("person");
  });

  it("handles negative count as plural", () => {
    expect(pluralize(-1, "item")).toBe("items");
  });
});
