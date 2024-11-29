"use client";
import QuestionNavigationPanel from "@/components/quiz/QuestionNavigationPanel";
import QuestionWithOptions from "@/components/quiz/question-with-options";
import { useExamineeTestStore } from "@/stores/examinee/store";

function Quiz({ params: { quizId } }: { params: { quizId: string } }) {
  const examineeTestResponse = useExamineeTestStore(
    (state) => state.examineeTestResponse
  );

  function handleTestSubmit(e?: React.FormEvent<HTMLFormElement>) {
    e?.preventDefault();
    console.log(examineeTestResponse);
  }

  return (
    <form
      onSubmit={handleTestSubmit}
      className="h-screen grid grid-cols-8 w-full p-16 gap-2"
    >
      <QuestionWithOptions quizId={quizId} />
      <QuestionNavigationPanel
        quizId={quizId}
        handleTestSubmit={handleTestSubmit}
      />
    </form>
  );
}

export default Quiz;
