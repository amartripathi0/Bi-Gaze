import { useEffect, useState } from "react";
import QuestionsWithOptions from "../../../components/question_panel/QuestionsWithOptions"
import QuestionNavigationPanel from "../../../components/question_panel/QuestionNavigationPanel";
import { questionsArray } from "../../../constants";


function MCQ_Test() {
    const [totalNumberOfQuestions , setTotalNumberOfQuestions] = useState(0)
    const [currentQuestion, setCurrentQuestion] = useState(1)

   useEffect(() => {
    setTotalNumberOfQuestions(questionsArray.length)
   }, []);

   function handleQuestionChange(questionNumber : number){
            console.log("e" , questionNumber);     
            setCurrentQuestion(questionNumber);
            
   }
   const questionToDisplay = questionsArray[currentQuestion-1]
  return (
    <form onSubmit = {(e) => e.preventDefault()} 
        className="w-screen h-screen flex-center p-16 rounded-lg gap-10">
        <QuestionsWithOptions question={{...questionToDisplay}}/>
        <QuestionNavigationPanel testName = {"  "} handleQuestionChangeButtonClick={handleQuestionChange} />
    </form>
  )
}

export default MCQ_Test
