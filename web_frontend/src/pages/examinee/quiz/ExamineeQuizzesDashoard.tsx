import QuizCard from "@/components/quiz/QuizCard";
import { quizzesArray } from "@/constants";

function ExamineeQuizzesDashoard() {
  return (
    <>
      {quizzesArray.map((eachQuiz) => (
        <QuizCard
          key={eachQuiz.quizId}
          quizId={eachQuiz.quizId}
          quizDescription={eachQuiz.quizDescription}
          quizTitle={eachQuiz.quizTitle}
          totalMarks={eachQuiz.totalMarks}
        />
      ))}
    </>
  );
}

export default ExamineeQuizzesDashoard;
