import { QuestionProp } from "../../types";
import QuestionOptions from "./QuestionOption";
import PurpleBorderContainer from "./containers/PurpleBorderContainer";

function QuestionsWithOptions({ question }: { question: QuestionProp }) {
  return (
    <PurpleBorderContainer additionalStyles="h-full w-3/4  p-10 flex flex-col gap-10 ">
      <h1 className="text-2xl">
        <span>Que:-{question.id} </span>
        {question.title}
      </h1>

      <div className="flex flex-col gap-6 px-2">
        {question?.options.map((option) => (
          <QuestionOptions
            key={`${option}`}
            question={question}
            optionValue={option}
          />
        ))}
      </div>
    </PurpleBorderContainer>
  );
}

export default QuestionsWithOptions;
