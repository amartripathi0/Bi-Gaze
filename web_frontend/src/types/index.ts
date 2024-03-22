export type QuestionProps = {
        id : number;
        title : string;
        options : string[];
    
}

export type ButtonProps = {
    label : string;
    handleButtonClick : () => void 
    additionalStyles ?:string
}
