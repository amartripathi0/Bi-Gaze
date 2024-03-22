import { questionsArray } from "../../constants"
import Button from "../shared/Button"
import QuestionNavigationButton from "./QuestionNavigationButton"

type QuestionNavigationButtonProps = {
    testName : string ;
    handleQuestionChangeButtonClick : () => void
}
function QuestionNavigationPanel({testName , handleQuestionChangeButtonClick } : QuestionNavigationButtonProps) {
  return (
    <div 
    className="h-full w-1/5 rounded-md  p-6 bg-slate-200 flex items-center justify-between flex-col "
    >
        <h1 className="text-xl">{testName}</h1>
        <h1>Questions Attempted:</h1>

        <div className="flex-center bg-red-100 p-6   gap-4 flex-wrap">
            {
                questionsArray.map(eachQuestion => (
                    <QuestionNavigationButton  handleButtonClick = {handleQuestionChangeButtonClick} key = {eachQuestion.id} buttonLabel={eachQuestion.id}/>
                ))
            }
        </div>

        <Button handleButtonClick={() => {}} label="Submit Test" />
    </div>
  )
}

export default QuestionNavigationPanel
