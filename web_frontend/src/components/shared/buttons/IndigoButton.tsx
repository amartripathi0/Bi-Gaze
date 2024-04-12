import { ButtonProps } from "@/types"
function IndigoButton({label , handleButtonClick , additionalStyles , icon : Icon} : ButtonProps) {
  return (
    <button className={`${additionalStyles} 
        border-white border p-4 rounded-xl text-xs font-semibold uppercase  h-full flex-between gap-2
         bg-gradient-to-r from-purple-800  to-indigo-900 hover:border-purple-500 hover:shadow-md hover:shadow-purple-500
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

export default IndigoButton
