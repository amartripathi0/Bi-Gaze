import { questionsArray } from "../../constants";
import { userSelectedAnswerStateProps } from "../../types";
import Button from "../shared/Button";
import QuestionNavigationButton from "./QuestionNavigationButton";
import WebcamFaceMeshViewer from "./WebcamFaceMeshViewer";
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
    <PurpleBorderContainer additionalStyles="h-full w-1/4 rounded-md  p-4  flex-center flex-col gap-4 ">
      <div className="h-1/2 w-full flex-between bg-gray-900 p-2 rounded-xl  ">

     <WebcamFaceMeshViewer webcamHeight="2/3" webcamWidth="full" />
      </div>
     
     <div className="bg-gray-900 p-2 rounded-xl flex items-center flex-col">

      <h1 className="text-xl">{testName}</h1>
      <h1>Questions Attempted:</h1>

      <div className="flex-center p-6   gap-4 flex-wrap">
        {questionsArray.map((eachQuestion) => (
          <QuestionNavigationButton
            handleButtonClick={handleQuestionChangeButtonClick}
            key={eachQuestion.id}
            buttonLabel={eachQuestion.id}
            questionAttempted = {userSelectedAnswer.some(ele => ele.id === eachQuestion.id)}
          />
        ))}
      </div>

      <Button  handleButtonClick={handleTestSubmit} label="Submit Test" />
     </div>
    </PurpleBorderContainer>
  );
}

export default QuestionNavigationPanel;
