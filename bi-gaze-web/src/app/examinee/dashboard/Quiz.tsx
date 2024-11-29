import QuestionsWithOptions from "../../../../../web_frontend/src/components/quiz/QuestionsWithOptions";
import QuestionNavigationPanel from "../../../../../web_frontend/src/components/quiz/QuestionNavigationPanel";
import { useExamineeTestStore } from "@/stores/examinee/store";
import { useParams } from "react-router-dom";
import { Question } from "@/types";

function Quiz() {
  const { quizId } = useParams();
  const allQuizzes = useExamineeTestStore((state) => state.quizzes);
  const quizById = allQuizzes.find(
    (eachQuiz) => eachQuiz.quizId === Number(quizId)
  );
  const questionsArray = quizById?.questions;

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

  const questionToDisplay =
    questionsArray && questionsArray[currentQuestion - 1];

  return (
    <form
      onSubmit={handleTestSubmit}
      className=" h-screen flex-center p-16 rounded-lg gap-10 "
    >
      <QuestionsWithOptions question={questionToDisplay as Question} />
      <QuestionNavigationPanel handleTestSubmit={handleTestSubmit} />
    </form>
  );
}

export default Quiz;
