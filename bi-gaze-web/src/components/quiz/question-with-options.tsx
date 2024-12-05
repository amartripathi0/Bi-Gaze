import QuestionOptions from "./QuestionOption";
import PurpleBorderContainer from "./containers/PurpleBorderContainer";
import { useExamineeTestStore } from "@/stores/examinee/store";
import Timer from "./timer";
import { Clock } from "lucide-react";
function QuestionWithOptions({ quizId }: { quizId: string }) {
  const quiz = useExamineeTestStore((state) => state.currentQuiz);

  const questionsArray = quiz?.questions;

  const currentQuestionNumber = useExamineeTestStore(
    (state) => state.currentQuestionNumber
  );
  const question = questionsArray && questionsArray[currentQuestionNumber - 1];
  return (
    <PurpleBorderContainer className="col-span-5 lg:col-span-6 overflow-y-scroll relative bg-neutral-950/80">
      <div className="bg-slate-900 rounded-t-lg p-4 flex-between sticky w-full top-0 left-0">
        <h3>{quiz?.title} Quiz</h3>
          <Timer quizTime={(quiz?.timeLimit || 30) * 60} />
      </div>
      <div className="text-base flex gap-2 p-4">
        <span className="border rounded p-2 text-neutral-300 text-base font-raleway h-fit">
          Que:-
          {/* {question?.id}{" "} */}
        </span>
        <h3 className="rounded p-2 px-2.5 border">{question?.title}</h3>
      </div>
      <div className="flex flex-col space-y-4 ml-20 p-4">
        {question?.options.map((option, key) => (
          <QuestionOptions
            key={key}
            question={question}
            optionValue={option}
            optionId={key}
          />
        ))}
      </div>
    </PurpleBorderContainer>
  );
}

export default QuestionWithOptions;
