import type { Participant } from "@/src/types/participant";
import { formatCurrency } from "@/src/lib/formatters";

interface ParticipantCardProps {
  participant: Participant;
}

export default function ParticipantCard({ participant }: ParticipantCardProps) {
  const { id, name, age, balance } = participant;

  return (
    <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 flex flex-col gap-4 hover:shadow-md transition-shadow">
      <div className="flex items-center justify-between">
        <span className="text-xs font-mono text-gray-400">{id}</span>
        <span className="text-xs bg-blue-50 text-blue-700 px-2 py-0.5 rounded-full font-medium">
          Age {age}
        </span>
      </div>

      <div>
        <p className="text-lg font-semibold text-gray-900">{name}</p>
        <p className="text-sm text-gray-500 mt-0.5">Retirement Participant</p>
      </div>

      <div className="border-t border-gray-50 pt-4">
        <p className="text-xs text-gray-400 uppercase tracking-wide mb-1">Account Balance</p>
        <p className="text-2xl font-bold text-emerald-600">{formatCurrency(balance)}</p>
      </div>
    </div>
  );
}
