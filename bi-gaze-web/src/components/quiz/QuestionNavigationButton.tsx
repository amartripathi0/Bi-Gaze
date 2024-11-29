import { useExamineeTestStore } from "@/stores/examinee/store";
type QuestionNavigationButtonProps = {
  buttonLabel: number;
  questionAttempted?: boolean;
};

function QuestionNavigationButton({
  buttonLabel,
  questionAttempted,
}: QuestionNavigationButtonProps) {
  const changeQuestion = useExamineeTestStore(
    (state) => state.setCurrentQuestionNumber
  );
  return (
    <button
      className={` border  rounded shadow-sm hover:shadow-gray-300 h-10 aspect-square text-lg font-medium border-slate-500 
    ${questionAttempted ? "bg-purple-500" : "bg-slate-800"}
    `}
      onClick={() => changeQuestion(buttonLabel)}
    >
      {buttonLabel}
    </button>
  );
}

export default QuestionNavigationButton;
