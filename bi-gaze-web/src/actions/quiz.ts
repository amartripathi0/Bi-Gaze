import { db } from "@/lib/firebase";
import { collection, getDocs } from "firebase/firestore";

export async function getAllQuizzes() {
  const quizzesCollection = collection(db, "Quiz");
  const quizSnapshot = await getDocs(quizzesCollection);
  const quizzesList = await Promise.all(
    quizSnapshot.docs.map(async (doc) => {
      const quizData = {
        id: doc.id,
        ...doc.data(),
      };

      // Fetching Questions under each Quiz document
      const questionsCollection = collection(doc.ref, "Questions");
      const questionSnapshot = await getDocs(questionsCollection);
      const questionsList = questionSnapshot.docs.map((qDoc) => ({
        id: qDoc.id,
        ...qDoc.data(),
      }));

      return { ...quizData, questions: questionsList };
    })
  );

  return quizzesList;
}
