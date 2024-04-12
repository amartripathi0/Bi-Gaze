import { LucideIcon } from "lucide-react";

export type QuizProp = {
  quizTitle : string ,
  createdBy : string ,
  questions:  QuestionProp[]
};
export type QuestionProp = {
    id: number;
    title: string;
    options: string[];
    answer: string;
};

export type ButtonProps = {
  label: string;
  handleButtonClick:
    | (() => void)
    | ((e?: React.FormEvent<HTMLFormElement>) => void);
  additionalStyles?: string;
  icon?: LucideIcon;
};


export interface ExamineeTestResponse extends QuestionProp {
  selectedOption: string;
}
