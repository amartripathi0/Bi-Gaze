"use client";
import { getAllQuizzes } from "@/actions/quiz";
import QuestionNavigationPanel from "@/components/quiz/QuestionNavigationPanel";
import QuestionWithOptions from "@/components/quiz/question-with-options";
import { useQueryData } from "@/hooks/useQueryData";
import { useExamineeTestStore } from "@/stores/examinee/store";
import { Quiz as QuizType } from "@/types/index.type";
// import { useExamineeTestStore } from "@/stores/examinee/store";

function Quiz({ params: { quizId } }: { params: { quizId: string } }) {
  const { data: quizzesArray } = useQueryData(["quizzes"], getAllQuizzes) as {
    data: QuizType[];
  };
   const quiz = quizzesArray?.find(
     (eachQuiz) => eachQuiz.id === quizId
   );
  const setCurrentQuiz = useExamineeTestStore((state) => state.setCurrentQuiz);
  if(quiz) setCurrentQuiz(quiz);
  
  return (
    <form
      onSubmit={(e) => e.preventDefault()}
      className="h-screen grid grid-cols-8 w-full p-16 gap-2"
    >
      <QuestionWithOptions quizId={quizId} />
      <QuestionNavigationPanel quizId={quizId} />
    </form>
  );
}

export default Quiz;
