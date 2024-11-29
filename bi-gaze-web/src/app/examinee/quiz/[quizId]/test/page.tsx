"use client";
import QuestionNavigationPanel from "@/components/quiz/QuestionNavigationPanel";
import QuestionWithOptions from "@/components/quiz/question-with-options";
// import { useExamineeTestStore } from "@/stores/examinee/store";

function Quiz({ params: { quizId } }: { params: { quizId: string } }) {

  return (
    <form
      onSubmit={(e) => e.preventDefault()}
      className="h-screen grid grid-cols-8 w-full p-16 gap-2"
    >
      <QuestionWithOptions quizId={quizId} />
      <QuestionNavigationPanel
        quizId={quizId}
      />
    </form>
  );
}

export default Quiz;
