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
    className="w-1/4 p-2 px-4 bg-plum-300 border-2 border-purple-700 rounded-xl shadow-sm hover:shadow-gray-400 hover:scale-[1.03] hover:transition-all duration-200
    text-md font-medium cursor-pointer 
    "
    onClick={() => handleOptionClick()} 
    value={optionValue}
    />
  )
}

export default QuestionOptions
