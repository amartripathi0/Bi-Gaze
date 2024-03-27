type QuestionOptionsProps = {
    optionValue : string ;
    // id : string; 
    handleOptionClick : () => void
}
function QuestionOptions({optionValue , handleOptionClick ,  } : QuestionOptionsProps) {
  return (
    <input
    type="button"
    name=""
    className="w-1/5 p-6 bg-plum-300 border-2 border-purple-700 rounded-xl shadow-lg shadow-gray-400 hover:scale-[1.03] hover:transition-all duration-200
    text-xl font-medium cursor-pointer bg-purple-100
    "
    onClick={() => handleOptionClick()} 
    value={optionValue}
    />
  )
}

export default QuestionOptions
