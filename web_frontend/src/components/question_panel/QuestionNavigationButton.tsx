type QuestionNavigationButtonProps = {
    buttonLabel : number
    questionVisited : boolean
    handleButtonClick : (e : number) => void
}

function QuestionNavigationButton({buttonLabel , handleButtonClick ,questionVisited} : QuestionNavigationButtonProps) {
  return (
    <button className={`border-black border-2 rounded-lg shadow-md shadow-gray-300 h-14 w-14
    ${questionVisited ? "bg-green-500" : "bg-slate-300"}
    `}
    onClick={() => handleButtonClick(buttonLabel)}>
        {buttonLabel}
    </button>
  )
}

export default QuestionNavigationButton
