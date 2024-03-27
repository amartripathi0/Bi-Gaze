import { questionsArray } from "../../constants";
import { userSelectedAnswerStateProps } from "../../types";
import Button from "../shared/Button";
import QuestionNavigationButton from "./QuestionNavigationButton";
import PurpleBorderContainer from "./containers/PurpleBorderContainer";

type QuestionNavigationButtonProps = {
  testName: string;
  handleQuestionChangeButtonClick: (e : number) => void;
  handleTestSubmit : (e ?: React.FormEvent<HTMLFormElement>) => void
  userSelectedAnswer: userSelectedAnswerStateProps[];


};
function QuestionNavigationPanel({
  testName,
  handleQuestionChangeButtonClick,
  handleTestSubmit,
  userSelectedAnswer

}: QuestionNavigationButtonProps ) {
  
  return (
    <PurpleBorderContainer additionalStyles="h-full w-1/5 rounded-md  p-6 bg-slate-200 flex items-center justify-between flex-col ">
      <h1 className="text-xl">{testName}</h1>
      <h1>Questions Attempted:</h1>

      <div className="flex-center bg-red-100 p-6   gap-4 flex-wrap">
        {questionsArray.map((eachQuestion) => (
          <QuestionNavigationButton
            handleButtonClick={handleQuestionChangeButtonClick}
            key={eachQuestion.id}
            buttonLabel={eachQuestion.id}
            questionAttempted = {userSelectedAnswer.some(ele => ele.id === eachQuestion.id)}
          />
        ))}
      </div>

      <Button handleButtonClick={handleTestSubmit} label="Submit Test" />
    </PurpleBorderContainer>
  );
}

export default QuestionNavigationPanel;
