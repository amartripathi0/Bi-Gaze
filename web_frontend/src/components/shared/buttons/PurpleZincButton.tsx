import { ButtonProps } from "@/types";

function PurpleZincButton( {
    type = "button",
    label,
    handleButtonClick,
    additionalStyles,
  }: ButtonProps) {
  return (
    <button 
    type={type}
    className={`${additionalStyles} 
    rounded text-sm bg-gradient-to-r from-purple-900 to-zinc-800 w-48
    `}
    onClick ={() => {handleButtonClick && handleButtonClick()}}
>
    {label}
  </button>
  )
}

export default PurpleZincButton
