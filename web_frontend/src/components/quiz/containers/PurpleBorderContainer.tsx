type PurpleBorderProps = {
    children : React.ReactNode
    additionalStyles : string
}
function PurpleBorderContainer({children ,additionalStyles} : PurpleBorderProps) {
  return (
    <div
    className={`${additionalStyles} border shadow-3xl shadow-gray-500 border-purple-900 rounded`}
    >{children}</div>
  )
}

export default PurpleBorderContainer
