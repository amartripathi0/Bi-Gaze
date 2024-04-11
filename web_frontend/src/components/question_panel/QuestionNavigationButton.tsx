
type QuestionNavigationButtonProps = {
    buttonLabel : number
    questionAttempted ?: boolean
    handleButtonClick : (e : number) => void

}

function  QuestionNavigationButton({buttonLabel , handleButtonClick ,questionAttempted} : QuestionNavigationButtonProps) {
  
  return (
    <button className={` border  rounded shadow-sm hover:shadow-gray-300 h-10 aspect-square text-lg font-medium border-slate-500 
    ${questionAttempted ? "bg-purple-500" : "bg-slate-800"}
    `}
    onClick={() => handleButtonClick(buttonLabel)}>
        {buttonLabel}
    </button>
  )
}

export default QuestionNavigationButton
