import { LucideIcon } from "lucide-react";

export type QuestionProps = {
        id : number;
        title : string;
        options : string[];
        answer : string
    
}

export type ButtonProps = {
    label : string;
    handleButtonClick : (() => void) | ((e?: React.FormEvent<HTMLFormElement>) => void)
    additionalStyles ?:string
    icon ?: LucideIcon 
}

export type userSelectedAnswerStateProps = {
    id: number;
    selectedOption: string;
   
}
