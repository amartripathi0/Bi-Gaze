import QuizCard from "@/components/quiz/QuizCard";
import { quizzesArray } from "@/constants";

function ExamineeQuizzesDashboard() {
  return (
    <div className="grid grid-cols-3 gap-4">
      {quizzesArray.map((eachQuiz) => (
        <QuizCard
          key={eachQuiz.quizId}
          quizId={eachQuiz.quizId}
          description={eachQuiz.description}
          title={eachQuiz.title}
          maxMarks={eachQuiz.maxMarks}
        />
      ))}
    </div>
  );
}

export default ExamineeQuizzesDashboard;
