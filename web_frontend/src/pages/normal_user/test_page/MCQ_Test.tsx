import { useEffect, useState } from "react";
import QuestionsWithOptions from "../../../components/question_panel/QuestionsWithOptions"
import QuestionNavigationPanel from "../../../components/question_panel/QuestionNavigationPanel";
import { questionsArray } from "../../../constants";
import { userSelectedAnswerStateProps } from "../../../types";

function MCQ_Test() {
    const [totalNumberOfQuestions , setTotalNumberOfQuestions] = useState(0)
    const [currentQuestion, setCurrentQuestion] = useState(1)
    const [userSelectedAnswer, setUserSelectedAnswer] = useState<userSelectedAnswerStateProps[]>([])

    
   useEffect(() => {
    setTotalNumberOfQuestions(questionsArray.length)
   }, []);

   function handleQuestionChange(questionNumber : number){
            setCurrentQuestion(questionNumber);
            
   }
   function handleTestSubmit(e ?: React.FormEvent<HTMLFormElement>  ){    
     e?.preventDefault()
     console.log(userSelectedAnswer);
     
   }
   const questionToDisplay = questionsArray[currentQuestion-1]
  return (
    <form onSubmit = {handleTestSubmit} 
        className="w-screen h-screen flex-center p-16 rounded-lg gap-10 bg-slate-200">
        <QuestionsWithOptions question={{...questionToDisplay}} setUserSelectedAnswer = {setUserSelectedAnswer}  userSelectedAnswer = {userSelectedAnswer}  />
        <QuestionNavigationPanel testName = {"  "} handleQuestionChangeButtonClick ={handleQuestionChange}  handleTestSubmit = {handleTestSubmit} userSelectedAnswer = {userSelectedAnswer}/>
    </form>
  )
}

export default MCQ_Test
