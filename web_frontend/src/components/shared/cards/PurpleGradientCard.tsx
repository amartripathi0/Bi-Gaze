import React from 'react'

function PurpleGradientCard({children , additionalStyles} : {children : React.ReactNode , additionalStyles ?: string}) {
  return (
    <div className={`${additionalStyles} text-sm opacity-90 text-justify rounded font-medium w-4/5 hover:shadow-md hover:opacity-100 transition-all duration-150 hover:shadow-purple-500 p-6
    bg-gradient-to-r from-purple-900 to-indigo-700`}>
        {children}
    </div>
  )
}

export default PurpleGradientCard
