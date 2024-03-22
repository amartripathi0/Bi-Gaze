import { QuestionProps } from "../../types"
import QuestionOptions from "./QuestionOptions";
interface QuestionObjectProp {
    question : QuestionProps ;
}
function QuestionsWithOptions({question} : QuestionObjectProp) {    
  return (
    <div 
    className="h-full w-4/5 bg-red-50 p-10"
    >

        <h1 className="text-3xl"><span>Que-{question.id}{" "}</span>{question.title}</h1>
        
            <div 
            className="flex flex-col gap-6"
            >

            {
                
                question.options.map(option => (
                    <QuestionOptions key={`${option}`} handleOptionClick = {() => { }} optionValue={option}/>
                    ))
            }
            </div>
        
    </div>
  )
}

export default QuestionsWithOptions
