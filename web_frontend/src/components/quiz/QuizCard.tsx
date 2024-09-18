import { QuizProp } from "@/types";
import { Link } from "react-router-dom";
import IndigoButton from "../shared/buttons/IndigoButton";
import { ArrowRight, PenIcon } from "lucide-react";
import { Button } from "../shared/Button";

function QuizCard({
  quizId,
  quizTitle,
  quizDescription,
  totalMarks,
}: Partial<QuizProp>) {
  return (
    <div className="border-gray-700 max-w-80 max-h-72 border flex flex-col gap-4 justify-between hover:border-gray-500 transition-all duration-150 p-3 rounded-lg bg-gray-900">
      <div className="flex justify-between gap-4">
        <h1 className="p-2 bg-[purple-800]  rounded-xl font-semibold">
          {quizTitle}
        </h1>
        <p className=" bg-purple-800 p-2 text-xs gap-2 rounded-xl  flex-between">
          Marks: <span className="font-semibold">{totalMarks}</span>
        </p>
      </div>

      <p className="px-2 text-zinc-300 text-sm h-1/3 text-ellipsis line-clamp-3 text-justify">
        {quizDescription}
      </p>

      <Link to={`/examinee/quizzes/quiz/${quizId}`} className="">
        <Button
          label="Attempt Quiz"
          variant='default'
          size='sm'
          icon={PenIcon}
          iconSide="right"
        />
      </Link>
    </div>
  );
}

export default QuizCard;
