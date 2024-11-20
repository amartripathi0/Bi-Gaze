import { QuizProp } from "@/types";
import IndigoButton from "../shared/buttons/IndigoButton";
import { ArrowRight } from "lucide-react";
import Link from "next/link";

function QuizCard({
  quizId,
  quizTitle,
  quizDescription,
  totalMarks,
}: Partial<QuizProp>) {
  return (
    <div className="border border-neutral-600 w-full h-52 flex flex-col justify-between hover:border-neutral-200 hover:bg-neutral-900  gap-2 transition-all duration-150 p-4 rounded-lg bg-neutral-800">
      <h4 className="p-2 bg-indigo-900 rounded font-semibold text-base text-white">
        {quizTitle}
      </h4>
      <p className="px-2 text-sm rounded flex justify-between text-white w-fit gap-2">
        Total Marks <span className="font-semibold">{totalMarks}</span>
      </p>
      <p className="px-2 text-neutral-300 text-sm h-1/3 line-clamp-4">
        {quizDescription}
      </p>

      <Link href={`/examinee/quiz/${quizId}`} className="mt-2">
        <IndigoButton
          iconSide="right"
          label="Attempt Quiz"
          additionalStyles=" group mx-2 text-sm border gap-2 flex items-center p-2 rounded bg-blue-500 hover:bg-blue-600 text-white"
          icon={
            <ArrowRight
              size={16}
              className="group-hover:translate-x-[2px] group-hover:-translate-y-[2px] transition-transform duration-150 -rotate-45"
            />
          }
        />
      </Link>
    </div>
  );
}

export default QuizCard;
