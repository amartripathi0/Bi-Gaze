import { ButtonProps } from "../../types"
function Button({label , handleButtonClick , additionalStyles} : ButtonProps) {
  return (
    <button className={`${additionalStyles} 
    w-full  bg-purple-400 h-14 rounded-2xl text-white text-xl
    `}
    onClick={() => handleButtonClick()}
    >{label}</button>
  )
}

export default Button
