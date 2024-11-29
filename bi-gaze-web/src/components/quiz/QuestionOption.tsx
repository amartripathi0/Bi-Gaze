import { cn } from "@/lib/utils";
import { useExamineeTestStore } from "@/stores/examinee/store";
import { AnswerAttempt, Question } from "@/types/index.type";

type QuestionOptionsProps = {
  optionValue: string;
  question: Question;
  optionId: number;
};
function QuestionOption({
  optionValue,
  question,
  optionId,
}: QuestionOptionsProps) {
  const setTestResponse = useExamineeTestStore(
    (state) => state.setExamineeTestResponse
  );
  const testResponse = useExamineeTestStore(
    (state) => state.examineeTestResponse
  );

  function handleOptionClick(question: Question, selectedOption: string) {
    const answerAttempt: AnswerAttempt = {
      ...question,
      selectedOption,
    };
    const questionAlreadyAnswered = testResponse.some(
      (eachSelectedAnswerObj) => eachSelectedAnswerObj.id === question.id
    );
    // question answered for first time -> add ans to the array
    if (!questionAlreadyAnswered) {
      setTestResponse([...testResponse, answerAttempt]);
    }
    // question already answered with diff option -> replace the old ans with new one
    // question already answered with same option -> replace the old ans with new one
    else {
      const existingAttemptedAnswer = testResponse.filter(
        (eachAns) => eachAns.id !== question.id
      );
      setTestResponse([...existingAttemptedAnswer, answerAttempt]);
    }
  }

  function isOptionSelected() {
    const questionObj = testResponse.filter(
      (eachSelectedAnswerObj) => eachSelectedAnswerObj.id === question.id
    );
    return questionObj[0]?.selectedOption === optionValue;
  }
  return (
    <button
      className={cn(
        "max-w-56 p-4 bg-neutral-950/80 border border-neutral-600 rounded shadow-xs hover:shadow-gray-400 hover:scale-[1.02] hover:transition-all duration-100 text-sm font-semibold cursor-pointer font-raleway flex justify-start items-center",
        isOptionSelected()
          ? "border-purple-700 shadow-sm shadow-purple-500 bg-slate-950"
          : ""
      )}
      onClick={() => handleOptionClick(question, optionValue)}
    >
      <span className="font-poppins mr-2 text-neutral-400 font-medium">
        {optionId + 1}.
      </span>
      {optionValue}
    </button>
  );
}

export default QuestionOption;
