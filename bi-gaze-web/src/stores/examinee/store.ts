import { quizzesArray } from "@/constants";
import { AnswerAttempt, Quiz } from "@/types/index.type";
import { create } from "zustand";

type ExamineeTestStore = {
  quizzes: Quiz[];
  currentQuiz: Quiz | null;
  examineeTestResponse: AnswerAttempt[];
  setExamineeTestResponse: (response: AnswerAttempt[]) => void;
  currentQuestionNumber: number;
  setCurrentQuestionNumber: (newQuestionNumber: number) => void;
  setCurrentQuiz: (quiz: Quiz) => void; 
};

export const useExamineeTestStore = create<ExamineeTestStore>((set) => ({
  quizzes: quizzesArray,
  currentQuiz: null,
  examineeTestResponse: [],
  setExamineeTestResponse: (response: AnswerAttempt[]) => {
    set(() => ({
      examineeTestResponse: response,
    }));
  },
  setCurrentQuiz: (quiz: Quiz) => {
    set(() => ({
      currentQuiz: quiz,
    }));
  },
  currentQuestionNumber: 1,
  setCurrentQuestionNumber: (newQuestionNumber: number) => {
    set(() => ({ currentQuestionNumber: newQuestionNumber }));
  },

  //   handleOptionSelect : (state) => {}
}));
