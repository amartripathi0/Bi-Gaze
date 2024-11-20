import QuizCard from "@/components/quiz/QuizCard";
import { quizzesArray } from "@/constants";

function ExamineeQuizzesDashoard() {
  return (
    <div className="grid grid-cols-3 gap-4">
      {quizzesArray.map((eachQuiz) => (
        <QuizCard
          key={eachQuiz.quizId}
          quizId={eachQuiz.quizId}
          quizDescription={eachQuiz.quizDescription}
          quizTitle={eachQuiz.quizTitle}
          totalMarks={eachQuiz.totalMarks}
        />
      ))}
    </div>
  );
}

export default ExamineeQuizzesDashoard;
