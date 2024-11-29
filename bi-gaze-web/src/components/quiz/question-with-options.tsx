import QuestionOptions from "./QuestionOption";
import PurpleBorderContainer from "./containers/PurpleBorderContainer";
import { useExamineeTestStore } from "@/stores/examinee/store";
function QuestionWithOptions({ quizId }: { quizId: string }) {
  const allQuizzes = useExamineeTestStore((state) => state.quizzes);
  const currentQuiz = allQuizzes.find(
    (eachQuiz) => eachQuiz.quizId === Number(quizId)
  );
  const questionsArray = currentQuiz?.questions;

  const currentQuestionNumber = useExamineeTestStore(
    (state) => state.currentQuestionNumber
  );
  const question = questionsArray && questionsArray[currentQuestionNumber - 1];
  return (
    <PurpleBorderContainer className="col-span-5 lg:col-span-6 overflow-y-scroll relative bg-neutral-950/80">
      <div className="bg-slate-900 rounded-t-lg p-4 flex-between sticky w-full top-0 left-0">
        <h3>{currentQuiz?.quizTitle}</h3>
        timer
      </div>
      <div className="text-sm flex gap-2 p-2">
        <span className="border rounded p-2 text-neutral-300 text-base font-raleway h-fit">
          Que:-{question?.id}{" "}
        </span>
        <h3 className="rounded p-2 px-2.5 border">{question?.title} Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam soluta natus ea mollitia reprehenderit, magni ullam itaque? Maiores sit laborum explicabo debitis rerum quae nam, consequatur consectetur at, veritatis hic quas. Libero inventore molestias commodi eveniet eum asperiores nemo vero! Lorem ipsum dolor sit amet consectetur, adipisicing elit. Placeat quis temporibus delectus nisi, repudiandae, mollitia necessitatibus quasi cupiditate nostrum doloribus ab aliquid! Corporis adipisci, itaque sequi deserunt voluptatem iure est, eos, magni alias minima illo harum enim cum laborum quam porro in accusantium quis esse aliquid eveniet labore quidem? Repudiandae incidunt doloribus enim rem, quisquam sapiente culpa reprehenderit aliquam dolore ratione aut laborum! Quam, sunt necessitatibus. Laudantium, at ipsa consectetur dolore facilis nulla, sequi quasi animi maiores tempore, sunt et. Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur cupiditate ut adipisci, ullam labore reiciendis quis sunt non porro exercitationem fugiat harum perspiciatis. Sunt tempore iusto commodi tenetur corrupti quos nobis corporis laudantium asperiores fugiat aliquid numquam sequi, hic dignissimos! Praesentium veniam dolores deserunt beatae sint, iste, neque nisi totam blanditiis tenetur doloribus, officia illum animi aspernatur repudiandae commodi! Labore.</h3>
      </div>
      <div className="flex flex-col space-y-4 ml-20 p-4">
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
