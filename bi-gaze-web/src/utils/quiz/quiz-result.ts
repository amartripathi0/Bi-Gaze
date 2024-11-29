import { useExamineeTestStore } from "@/stores/examinee/store";

export const quizResult = () => {
  const examineeAttemptedQiz =
    useExamineeTestStore.getState().examineeTestResponse;

  let result = 0;
  examineeAttemptedQiz.forEach((eachQuestion) => {
    if (eachQuestion.selectedOption === eachQuestion.answer) {
      result++;
    }
  });
  return result;
};
