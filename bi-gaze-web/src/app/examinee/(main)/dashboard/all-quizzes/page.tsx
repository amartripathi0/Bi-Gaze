"use client";
import { getAllQuizzes } from "@/actions/quiz";
import QuizCard from "@/components/quiz/QuizCard";
import { useQueryData } from "@/hooks/useQueryData";
// import { quizzesArray } from "@/constants";
import { Quiz } from "@/types/index.type";

function ExamineeQuizzesDashboard() {
  const { data: quizzesArray } = useQueryData(["quizzes"], getAllQuizzes) as {
    data: Quiz[];
  };
  return (
    <div className="grid grid-cols-3 gap-4">
      {quizzesArray?.map((eachQuiz: Quiz) => (
        <QuizCard
          key={eachQuiz.id}
          id={eachQuiz.id}
          description={eachQuiz.description}
          title={eachQuiz.title}
          maxMarks={eachQuiz.maxMarks}
        />
      ))}
    </div>
  );
}

export default ExamineeQuizzesDashboard;
