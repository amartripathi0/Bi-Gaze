import {quizArray } from "@/constants";
import { ExamineeTestResponse, QuizProp } from "@/types";
import { create } from "zustand";

type ExamineeTestStore = {
  quiz : QuizProp ;
  examineeTestResponse : ExamineeTestResponse[];
  setExamineeTestResponse  : (response : ExamineeTestResponse[]) => void;
  currentQuestionNumber : number
  setCurrentQuestionNumber : (newQuestionNumber : number) => void
};

export const useExamineeTestStore = create<ExamineeTestStore>((set) => ({
  quiz : quizArray ,
  examineeTestResponse  : [],
  setExamineeTestResponse  : (response : ExamineeTestResponse[]) => {
    set(() => ({
        
        examineeTestResponse : response}
    ))
  },
  currentQuestionNumber : 1 ,
  setCurrentQuestionNumber : (newQuestionNumber : number) => {
    set(() => ({currentQuestionNumber : newQuestionNumber}))
  }

  
//   handleOptionSelect : (state) => {}
}));
