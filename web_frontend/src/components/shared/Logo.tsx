type LogoProps = {
    height ?: string
    width ?: string
    src : string
    alt ?:string
}
function Logo({height = "10", width = "10" , src , alt = "logo"} : LogoProps) {
  
  return (
        <img
        className={` aspect-square h-${height} w-${width}`}
        src={src}
        alt={alt} />
  
  )
}

export default Logo
