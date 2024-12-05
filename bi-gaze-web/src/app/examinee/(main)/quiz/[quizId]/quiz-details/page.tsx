"use client";
import IndigoButton from "@/components/shared/buttons/IndigoButton";
import { db } from "@/lib/firebase";
import { collection, getDocs } from "firebase/firestore";
import { doc, setDoc } from "firebase/firestore";

import { ArrowRight } from "lucide-react";
import Link from "next/link";
import React from "react";

export default function QuizDetails({
  params: { quizId },
}: {
  params: { quizId: string };
}) {
  async function handleTestStart() {
    const testCollection = collection(db, "examiner");
    const testSnapshot = await getDocs(testCollection);
    const tests = testSnapshot.docs.map((doc) => ({
      id: doc.id,
      ...doc.data(),
    }));

    // Change the first element's key testStart to true if tests array is not empty
    console.log(tests);
    
    if (tests.length > 0) {
      const firstTest = { ...tests[0], teststart: true }; // Create a new object with testStart set to true
      await setDoc(doc(db, "examiner", firstTest.id), firstTest);
    }

    // Redirect to the test page
    // window.location.href = `/examinee/quiz/${quizId}/test`;
  }
  // 
  return (
    <div>
      <Link
        href={`/examinee/quiz/${quizId}/test`}
        className="mt-2"
        onClick={handleTestStart}
      >
        <IndigoButton
          iconSide="right"
          label="Attempt Quiz"
          className=" group mx-2 text-sm border gap-2 flex items-center sm:p-2.5 rounded bg-blue-500 hover:bg-blue-600 text-white"
          icon={
            <ArrowRight
              size={16}
              className="group-hover:translate-x-[2px] group-hover:-translate-y-[2px] transition-transform duration-150 -rotate-45"
            />
          }
        />
      </Link>{" "}
    </div>
  );
}
