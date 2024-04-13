import { QuizProp } from "@/types";
// import { Link } from "react-router-dom";

function QuizCard({
//   quizId,
  quizTitle,
  quizDescription,
  totalMarks,
}: Partial<QuizProp>) {
  return (
    <div className="border-gray-700 w-1/4 h-1/2 border flex flex-col justify-between hover:border-white transition-all duration-150 p-4 rounded-xl bg-gray-900">
      <h1 className="px-4 py-2 bg-[purple-800] rounded-xl font-semibold">
        {quizTitle}
      </h1>
      <h3 className=" bg-purple-800 px-4 py-2 text-sm rounded-xl w-1/2 flex-between">
        
        Total Marks <span className="font-semibold">{totalMarks}</span>
      </h3>
      <p className="px-2 text-slate-300 text-sm h-1/3 text-ellipsis line-clamp-4 text-justify    ">
        {quizDescription}
       
      </p>
      {/* <Link to={`/examinee/quizzes/quiz:${quizId}`}  className="mx-2 text-xs border w-1/3 p-2 rounded">Attempt Quiz</Link> */}
    </div>
  );
}

export default QuizCard;
