import { quizzesArray } from "@/constants";
import { AnswerAttempt, Quiz } from "@/types";
import { create } from "zustand";

type ExamineeTestStore = {
  quizzes: Quiz[];
  examineeTestResponse: AnswerAttempt[];
  setExamineeTestResponse: (response: AnswerAttempt[]) => void;
  currentQuestionNumber: number;
  setCurrentQuestionNumber: (newQuestionNumber: number) => void;
};

export const useExamineeTestStore = create<ExamineeTestStore>((set) => ({
  quizzes: quizzesArray,
  examineeTestResponse: [],
  setExamineeTestResponse: (response: AnswerAttempt[]) => {
    set(() => ({
      examineeTestResponse: response,
    }));
  },
  currentQuestionNumber: 1,
  setCurrentQuestionNumber: (newQuestionNumber: number) => {
    set(() => ({ currentQuestionNumber: newQuestionNumber }));
  },

  //   handleOptionSelect : (state) => {}
}));
