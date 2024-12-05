import { useExamineeTestStore } from "@/stores/examinee/store";
import Button from "../shared/Button";
import QuestionNavigationButton from "./QuestionNavigationButton";
import WebcamFaceMeshViewer from "./WebcamFaceMeshViewer";
import PurpleBorderContainer from "./containers/PurpleBorderContainer";
import Link from "next/link";
import { collection, doc, getDocs, setDoc } from "firebase/firestore";
import { db } from "@/lib/firebase";
// import { useQueryData } from "@/hooks/useQueryData";
// import { getAllQuizzes } from "@/actions/quiz";
// import { Quiz } from "@/types/index.type";

type QuestionNavigationButtonProps = {
  // handleTestSubmit: (e?: React.FormEvent<HTMLFormElement>) => void;
  quizId: string;
};

function QuestionNavigationPanel({
  // handleTestSubmit,
  // quizId,
}: QuestionNavigationButtonProps) {
  const quiz = useExamineeTestStore((state) => state.currentQuiz);
 
  // const { data: quizzesArray } = useQueryData(["quizzes"], getAllQuizzes) as {
  //   data: Quiz[];
  // };
  // const quizById = quizzesArray?.find(
  //   (eachQuiz) => eachQuiz.id === quizId
  // );
  // if (quizById === undefined) throw new Error("Quiz not found");

  const examineeTestResponse = useExamineeTestStore(
    (state) => state.examineeTestResponse
  );
  // console.log(quizById);
  const handleTestSubmit = async () => {
    const testCollection = collection(db, "examiner");
    const testSnapshot = await getDocs(testCollection);
    const tests = testSnapshot.docs.map((doc) => ({
      id: doc.id,
      ...doc.data(),
    }));

    if (tests.length > 0) {
      const firstTest = { ...tests[0], teststart: false }; // Set testStart to false
      await setDoc(doc(db, "examiner", firstTest.id), firstTest);
    }
  };
  return (
    <PurpleBorderContainer className="h-full w-full col-span-3 lg:col-span-2 rounded-md  p-4  flex-center flex-col gap-4 ">
      <div className="h-1/2 w-full flex-between bg-gray-900 p-2 rounded-xl  border ">
        <WebcamFaceMeshViewer webcamHeight="2/3" webcamWidth="full" />
      </div>

      <div className="bg-gray-900 p-3 rounded-xl flex items-center flex-col gap-4">
        {/* <h1 className="text-xl">{quizById.title}</h1> */}
        <p>Questions Attempted:</p>

        <div className="flex-center p-2  gap-4 flex-wrap">
          {quiz?.questions.map((eachQuestion, index) => (
            <QuestionNavigationButton
              key={eachQuestion.id}
              buttonLabel={index + 1}
              questionAttempted={examineeTestResponse.some(
                (ele) => ele.id === eachQuestion.id
              )}
            />
          ))}
        </div>

        <Link href={"result"}>
          <Button label="Submit Test" handleButtonClick={handleTestSubmit}/>
        </Link>
      </div>
    </PurpleBorderContainer>
  );
}

export default QuestionNavigationPanel;
