import { ButtonProps } from "@/types"
function PurpleButton({label , handleButtonClick , additionalStyles , icon : Icon} : ButtonProps) {
  return (
    <button className={`${additionalStyles} 
        border-white border-2 p-4 rounded-xl text-xl font-semibold px-4  h-full flex-btwn-center gap-2
         bg-gradient-to-r from-purple-800 v  via-indigo-900 hover:border-purple-500 hover:shadow-md hover:shadow-purple-500
         hover:scale-105 hover:transition-all duration-300
    `}
    onClick={() => handleButtonClick()}
        > 
        <Icon size={16}/>
        {label}</button>
  )
}

export default PurpleButton
