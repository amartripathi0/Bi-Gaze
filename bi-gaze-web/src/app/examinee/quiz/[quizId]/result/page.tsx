"use client";

import { useExamineeTestStore } from "@/stores/examinee/store";
import { AnswerAttempt, Quiz } from "@/types/index.type";
import { useEffect, useState } from "react";
import { motion } from "framer-motion";

export default function Result({
  params: { quizId },
}: {
  params: { quizId: string };
}) {
  const examineeTestResponse = useExamineeTestStore(
    (state) => state.examineeTestResponse
  );
  const allQuizzes = useExamineeTestStore((state) => state.quizzes);
  const currentQuiz: Quiz | undefined = allQuizzes.find(
    (quiz) => quiz.quizId === Number(quizId)
  );

  const [totalScore, setTotalScore] = useState<number>(0);

  useEffect(() => {
    setTotalScore(getTotalScore());
  }, [examineeTestResponse]);

  function getTotalScore(): number {
    return examineeTestResponse.reduce((score, question: AnswerAttempt) => {
      return question.selectedOption === question.answer
        ? score + question.marks
        : score;
    }, 0);
  }

  const percentage: number = Math.round(
    (totalScore / (currentQuiz?.totalMarks || 1)) * 100
  );

  return (
    <div className="min-h-screen py-12 px-4 bg-gradient-to-br from-blue-50 via-purple-50 to-pink-50 dark:from-gray-900 dark:via-purple-900 dark:to-violet-900">
      <motion.div
        className="max-w-4xl mx-auto rounded-2xl shadow-2xl overflow-hidden bg-white dark:bg-gray-800 text-gray-800 dark:text-white"
        initial={{ opacity: 0, y: 50 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.8 }}
      >
        <div className="p-8">
          <h1 className="text-3xl font-bold text-center text-purple-600 dark:text-purple-400">
            {currentQuiz?.quizTitle}
          </h1>

          <ResultSummary
            percentage={percentage}
            totalScore={totalScore}
            totalMarks={currentQuiz?.totalMarks}
            examineeTestResponse={examineeTestResponse}
          />
        </div>
      </motion.div>
    </div>
  );
}

interface ResultSummaryProps {
  percentage: number;
  totalScore: number;
  totalMarks?: number;
  examineeTestResponse: AnswerAttempt[];
}

function ResultSummary({
  percentage,
  totalScore,
  totalMarks,
  examineeTestResponse,
}: ResultSummaryProps) {
  return (
    <div className="flex flex-col items-center justify-center space-y-6 my-6">
      <div className="relative w-36 h-36">
        <svg className="w-full h-full transform -rotate-90">
          <circle
            className="text-gray-200 dark:text-gray-700 stroke-current"
            strokeWidth="8"
            cx="70"
            cy="72"
            r="60"
            fill="none"
          />
          <motion.circle
            className="text-purple-500 stroke-current"
            strokeWidth="8"
            strokeLinecap="round"
            cx="70"
            cy="72"
            r="60"
            fill="none"
            initial={{ pathLength: 0 }}
            animate={{
              pathLength: Math.max(0, Math.min(percentage, 100)) / 100,
            }} // Ensure percentage is within 0-100
            transition={{ duration: 2, ease: "easeOut" }}
          />
        </svg>
        <div className="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 text-center">
          <motion.div
            initial={{ scale: 0 }}
            animate={{ scale: 1 }}
            transition={{ delay: 0.5 }}
          >
            <p className="text-xl font-bold">
              {Math.max(0, Math.min(percentage, 100))}%
            </p>
            <p className="text-sm opacity-75">
              Score: {totalScore}/{totalMarks}
            </p>
          </motion.div>
        </div>
      </div>

      <div className="w-full space-y-4">
        {examineeTestResponse.map((question: AnswerAttempt, index: number) => (
          <QuestionResponseDetail
            key={index}
            question={question}
            index={index}
          />
        ))}
      </div>
    </div>
  );
}

interface QuestionResponseDetailProps {
  question: AnswerAttempt;
  index: number;
}

function QuestionResponseDetail({ question, index }: QuestionResponseDetailProps) {
  return (
    <motion.div
      className={`p-4 rounded-lg shadow-md transition-colors duration-300 ${
        question.selectedOption === question.answer
          ? "bg-green-50 dark:bg-green-900/30 border border-green-200 dark:border-green-700"
          : "bg-red-50 dark:bg-red-900/30 border border-red-200 dark:border-red-700"
      }`}
      initial={{ opacity: 0, x: -50 }}
      animate={{ opacity: 1, x: 0 }}
      transition={{ duration: 0.3, delay: index * 0.1 }}
    >
      <div className="flex justify-between gap-4">
        <h3 className="font-medium text-base mb-2 line-clamp-3">
          {question.title}
        </h3>
        <p className="text-sm max-w-60 h-fit border p-2 rounded text-center border-neutral-300">
          Marks:{" "}
          {question.selectedOption === question.answer ? question.marks : 0}/
          {question.marks}
        </p>
      </div>
      <div className="space-y-2 text-sm">
        <p className="flex items-center">
          <span className="w-24">Your Answer:</span>
          <span
            className={`font-bold ${
              question.selectedOption === question.answer
                ? "text-green-600 dark:text-green-400"
                : "text-red-600 dark:text-red-400"
            }`}
          >
            {question.selectedOption}
          </span>
        </p>
        <p className="flex items-center">
          <span className="w-24">Correct:</span>
          <span className="font-bold text-green-600 dark:text-green-400">
            {question.answer}
          </span>
        </p>
      </div>
    </motion.div>
  );
}
