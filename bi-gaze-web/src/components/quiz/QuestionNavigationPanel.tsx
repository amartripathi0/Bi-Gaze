import { useExamineeTestStore } from "@/stores/examinee/store";
import Button from "../shared/Button";
import QuestionNavigationButton from "./QuestionNavigationButton";
// import WebcamFaceMeshViewer from "./WebcamFaceMeshViewer";
import PurpleBorderContainer from "./containers/PurpleBorderContainer";
import Link from "next/link";

type QuestionNavigationButtonProps = {
  // handleTestSubmit: (e?: React.FormEvent<HTMLFormElement>) => void;
  quizId: string;
};

function QuestionNavigationPanel({
  // handleTestSubmit,
  quizId,
}: QuestionNavigationButtonProps) {
  const allQuizzes = useExamineeTestStore((state) => state.quizzes);
  const quizById = allQuizzes?.find(
    (eachQuiz) => eachQuiz.quizId === Number(quizId)
  );
  if (quizById === undefined) throw new Error("Quiz not found");

  const examineeTestResponse = useExamineeTestStore(
    (state) => state.examineeTestResponse
  );
  console.log(examineeTestResponse);

  return (
    <PurpleBorderContainer className="h-full w-full col-span-3 lg:col-span-2 rounded-md  p-4  flex-center flex-col gap-4 ">
      <div className="h-1/2 w-full flex-between bg-gray-900 p-2 rounded-xl  border ">
        {/* <WebcamFaceMeshViewer webcamHeight="2/3" webcamWidth="full" /> */}
      </div>

      <div className="bg-gray-900 p-3 rounded-xl flex items-center flex-col gap-4">
        {/* <h1 className="text-xl">{quizById.title}</h1> */}
        <p>Questions Attempted:</p>

        <div className="flex-center p-2  gap-4 flex-wrap">
          {quizById.questions.map((eachQuestion) => (
            <QuestionNavigationButton
              key={eachQuestion.id}
              buttonLabel={eachQuestion.id}
              questionAttempted={examineeTestResponse.some(
                (ele) => ele.id === eachQuestion.id
              )}
            />
          ))}
        </div>

        <Link href={"result"}>
          <Button label="Submit Test" />
        </Link>
      </div>
    </PurpleBorderContainer>
  );
}

export default QuestionNavigationPanel;
