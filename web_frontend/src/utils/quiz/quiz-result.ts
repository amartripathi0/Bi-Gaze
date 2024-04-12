import { useExamineeTestStore } from "@/stores/examinee/utils/store"

export const quizResult = () => {
    const examineeAttemptedQiz = useExamineeTestStore.getState().examineeTestResponse;

    console.log(examineeAttemptedQiz);
    
}


