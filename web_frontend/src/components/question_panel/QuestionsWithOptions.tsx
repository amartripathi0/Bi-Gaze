import { QuestionProps, userSelectedAnswerStateProps } from "../../types";
import QuestionOptions from "./QuestionOptions";
import PurpleBorderContainer from "./containers/PurpleBorderContainer";
// interface QuestionObjectProp {
//     question : QuestionProps ;
// }
function QuestionsWithOptions({
  question,
  setUserSelectedAnswer,
  userSelectedAnswer,
}: {
  question: QuestionProps;
  setUserSelectedAnswer: React.Dispatch<
    React.SetStateAction<userSelectedAnswerStateProps[]
    >
  >;
  userSelectedAnswer: userSelectedAnswerStateProps[];

}) {
  function handleOptionClick(questionId: number, option: string) {
    
    if(userSelectedAnswer.length === 0){
      setUserSelectedAnswer([...userSelectedAnswer , {id : questionId , selectedOption : option}])          
    }
    userSelectedAnswer.forEach((eachSelectedAnswerObj => {
      // question answered for first time -> add ans to the array
      
       if(eachSelectedAnswerObj.id !== questionId) {
        setUserSelectedAnswer([...userSelectedAnswer , {id : questionId , selectedOption : option}])          
       }

      // question already answered with diff option -> replace the old ans with new one
      // question already answered with same option -> replace the old ans with new one
      else if(eachSelectedAnswerObj.id === questionId){
          const removedExistingAttempedAns = userSelectedAnswer.filter((eachAns) => eachAns.id !== questionId)
          setUserSelectedAnswer([...removedExistingAttempedAns , {id : questionId , selectedOption : option}])          
      }   
    }))
  }
  return (
    <PurpleBorderContainer additionalStyles ="h-full w-3/4  p-10 flex flex-col gap-10 ">
      <h1 className="text-2xl">
        <span>Que:-{question.id} </span>
        {question.title}
      </h1>

      <div className="flex flex-col gap-6 px-2">
        {question.options.map((option) => (
          <QuestionOptions
            key={`${option}`}
            handleOptionClick={() => handleOptionClick(question.id, option)}
            optionValue={option}
          />
        ))}
      </div>
    </PurpleBorderContainer>
  );
}

export default QuestionsWithOptions;
