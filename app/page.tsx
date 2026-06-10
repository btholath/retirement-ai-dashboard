import { getParticipants } from "@/src/lib/participants";
import { pluralize } from "@/src/lib/formatters";
import ParticipantCard from "@/src/components/ParticipantCard";

export default function HomePage() {
  const participants = getParticipants();

  return (
    <main className="min-h-screen bg-gray-50 px-6 py-10">
      <header className="mb-10">
        <h1 className="text-3xl font-bold text-gray-900">Retirement Dashboard</h1>
        <p className="text-gray-500 mt-1">
          {participants.length} {pluralize(participants.length, "participant")} enrolled
        </p>
      </header>

      <section>
        <h2 className="text-sm font-semibold uppercase tracking-wide text-gray-400 mb-4">
          Participants
        </h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
          {participants.map((participant) => (
            <ParticipantCard key={participant.id} participant={participant} />
          ))}
        </div>
      </section>
    </main>
  );
}
