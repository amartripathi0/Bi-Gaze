import QuizCard from "@/components/quiz/QuizCard"
import { quizzesArray } from "@/constants"

function ExamineeQuizzesDashoard() {
  return (
    <div className="h-screen w-screen p-20">
        <div className="flex flex-wrap gap-10 h-full w-full">

        {
            quizzesArray.map(eachQuiz => (
                <QuizCard 
                key={eachQuiz.quizId}
                quizId={eachQuiz.quizId}
                quizDescription={eachQuiz.quizDescription}
                quizTitle={eachQuiz.quizTitle}
                totalMarks={eachQuiz.totalMarks}
                />
            ))
        }
        </div>
    </div>
  )
}

export default ExamineeQuizzesDashoard
