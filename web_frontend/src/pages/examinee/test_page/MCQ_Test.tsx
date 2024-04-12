import QuestionsWithOptions from "../../../components/question_panel/QuestionsWithOptions";
import QuestionNavigationPanel from "../../../components/question_panel/QuestionNavigationPanel";
import { useExamineeTestStore } from "@/stores/examinee/utils/store";

function MCQ_Test() {
  const questionsArray = useExamineeTestStore((state) => state.quiz.questions);
  const currentQuestion = useExamineeTestStore(
    (state) => state.currentQuestionNumber
  );
  const examineeTestResponse = useExamineeTestStore(
    (state) => state.examineeTestResponse
  );

  function handleTestSubmit(e?: React.FormEvent<HTMLFormElement>) {
    e?.preventDefault();
    console.log(examineeTestResponse);
  }
  const questionToDisplay = questionsArray[currentQuestion - 1];
  return (
    <form
      onSubmit={handleTestSubmit}
      className=" h-screen flex-center p-16 rounded-lg gap-10 "
    >
      <QuestionsWithOptions question={{ ...questionToDisplay }} />
      <QuestionNavigationPanel handleTestSubmit={handleTestSubmit} />
    </form>
  );
}

export default MCQ_Test;
