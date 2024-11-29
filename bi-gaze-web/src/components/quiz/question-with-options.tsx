import { Question } from "@/types";
import QuestionOptions from "./QuestionOption";
import PurpleBorderContainer from "./containers/PurpleBorderContainer";

function QuestionWithOptions({ question }: { question: Question }) {
  return (
    <PurpleBorderContainer additionalStyles="grid col-span-3 p-8 flex flex-col gap-8">
      <div className="text-lg flex gap-2">
        <span className="border rounded p-2 text-neutral-300 text-base font-raleway">
          Que:-{question?.id}{" "}
        </span>
        <h3 className="border rounded p-2 px-2.5">{question?.title}</h3>
      </div>
      <div className="flex flex-col space-y-4 ml-6">
        {question?.options.map((option, key) => (
          <QuestionOptions
            key={key}
            question={question}
            optionValue={option}
            optionId={key}
          />
        ))}
      </div>
    </PurpleBorderContainer>
  );
}

export default QuestionWithOptions;
