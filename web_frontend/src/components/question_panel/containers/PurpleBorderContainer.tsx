type PurpleBorderProps = {
    children : React.ReactNode
    additionalStyles : string
}
function PurpleBorderContainer({children ,additionalStyles} : PurpleBorderProps) {
  return (
    <div
    className={`${additionalStyles} bg-purple-50 border-4 shadow-3xl shadow-gray-500 border-purple-900 rounded-3xl`}
    >{children}</div>
  )
}

export default PurpleBorderContainer
