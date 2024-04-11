import { ButtonProps } from "@/types"
function PurpleButton({label , handleButtonClick , additionalStyles , icon : Icon} : ButtonProps) {
  return (
    <button className={`${additionalStyles} 
        border-white border p-4  rounded-xl text-sm font-semibold   h-full flex-between gap-4
         bg-gradient-to-r from-purple-800 v  via-indigo-900 hover:border-purple-500 hover:shadow-md hover:shadow-purple-500
         hover:scale-105 hover:transition-all duration-300
    `}
    onClick={() => handleButtonClick()}
        > 
        {
          Icon && <Icon size={16}/>
        }
        
        {label}</button>
  )
}

export default PurpleButton
