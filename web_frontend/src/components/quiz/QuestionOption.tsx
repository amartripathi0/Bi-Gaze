import { useExamineeTestStore } from "@/stores/examinee/store";
import { ExamineeTestResponse, Question } from "@/types";

type QuestionOptionsProps = {
  optionValue: string;
  question: Question;
};
function QuestionOption({ optionValue, question }: QuestionOptionsProps) {
  const setExamineeOptionSelect = useExamineeTestStore(
    (state) => state.setExamineeTestResponse
  );
  const examineeTestResponse = useExamineeTestStore(
    (state) => state.examineeTestResponse
  );

  function handleOptionClick(question: Question, selectedOption: string) {
    const examineeSelectedOption: ExamineeTestResponse = {
      ...question,
      selectedOption,
    };
    if (examineeTestResponse.length === 0) {
      setExamineeOptionSelect([
        ...examineeTestResponse,
        examineeSelectedOption,
      ]);
    } else {
      const questionAlreadyAnswered = examineeTestResponse.some(
        (eachSelectedAnswerObj) => eachSelectedAnswerObj.id === question.id
      );

      // question answered for first time -> add ans to the array
      if (!questionAlreadyAnswered) {
        console.log("first time");

        setExamineeOptionSelect([
          ...examineeTestResponse,
          examineeSelectedOption,
        ]);
      }
      // question already answered with diff option -> replace the old ans with new one
      // question already answered with same option -> replace the old ans with new one
      else {
        const removedExistingAttempedAns = examineeTestResponse.filter(
          (eachAns) => eachAns.id !== question.id
        );
        setExamineeOptionSelect([
          ...removedExistingAttempedAns,
          examineeSelectedOption,
        ]);
      }
    }
  }

  return (
    <input
      type="button"
      name=""
      className="w-1/4 p-2 px-4 bg-plum-300 border-2 border-purple-700 rounded-xl shadow-sm hover:shadow-gray-400 hover:scale-[1.03] hover:transition-all duration-200
    text-md font-medium cursor-pointer 
    "
      onClick={() => handleOptionClick(question, optionValue)}
      value={optionValue}
    />
  );
}

export default QuestionOption;
