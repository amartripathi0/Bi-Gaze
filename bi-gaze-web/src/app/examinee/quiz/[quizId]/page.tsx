"use client";
import QuestionNavigationPanel from "@/components/quiz/QuestionNavigationPanel";
import QuestionWithOptions from "@/components/quiz/question-with-options";
import { useExamineeTestStore } from "@/stores/examinee/store";
import { Question } from "@/types";

function Quiz({ params: { quizId } }: { params: { quizId: string } }) {
  const allQuizzes = useExamineeTestStore((state) => state.quizzes);
  const currentQuiz = allQuizzes.find(
    (eachQuiz) => eachQuiz.quizId === Number(quizId)
  );
  const questionsArray = currentQuiz?.questions;

  const currentQuestion = useExamineeTestStore(
    (state) => state.currentQuestionNumber
  );

  function handleTestSubmit(e?: React.FormEvent<HTMLFormElement>) {
    e?.preventDefault();
    // console.log(examineeTestResponse);
  }

  const questionToDisplay =
    questionsArray && questionsArray[currentQuestion - 1];

  return (
    <form
      onSubmit={handleTestSubmit}
      className="h-screen grid grid-cols-4 w-full p-16 gap-2 "
    >
      <QuestionWithOptions question={questionToDisplay as Question} />
      <QuestionNavigationPanel
        quizId={quizId}
        handleTestSubmit={handleTestSubmit}
      />
    </form>
  );
}

export default Quiz;
