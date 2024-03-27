
function PurpleBlur({ additionalStyles} : {additionalStyles ?: string}) {
  return (
    <div 
    className={`${additionalStyles}  absolute  h-[55%] w-11/12 blur-[80px]  opacity-80 rounded-full
    bg-purple-500`}
    />
  )
}

export default PurpleBlur
