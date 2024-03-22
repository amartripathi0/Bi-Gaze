type QuestionOptionsProps = {
    optionValue : string ;
    // id : string; 
    handleOptionClick : () => void
}
function QuestionOptions({optionValue , handleOptionClick  } : QuestionOptionsProps) {
  return (
    <input
    type="button"
    name=""
    className="w-1/5 p-6 bg-gray-300"
    onClick={() => handleOptionClick()} 
    value={optionValue}
    />
  )
}

export default QuestionOptions
