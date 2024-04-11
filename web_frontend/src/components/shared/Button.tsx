import { ButtonProps } from "../../types"
function Button({label , handleButtonClick , additionalStyles} : ButtonProps) {
  return (
    <button className={`${additionalStyles} 
     bg-purple-600 h-10 rounded-xl text-white text-lg w-4/5
    `}
    onClick={() => handleButtonClick()}
    >{label}</button>
  )
}

export default Button
