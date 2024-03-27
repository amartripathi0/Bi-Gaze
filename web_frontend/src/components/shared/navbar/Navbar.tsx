import Logo from "../Logo"
import { bigazeLogo, navbarItems } from "../../../constants"
import { Link } from "react-router-dom"
import NavButton from "../NavButton"
import { motion } from "framer-motion"



function Navbar() {
  return (
    <motion.nav 
    className="flex-btwn-center border-1 fixed top-0 left-0 z-50  backdrop-blur-lg border-black w-full h-24  py-4 px-20 "
    initial =  {{
      opacity : 0,
      y:-30

    }}
    animate = {{
      opacity : 1,
      y:0
    }}
    transition={{ duration: 1 }}

    >
            {/* Left: Bi-Gaze Logo */}
            <Link to={"/"} className="  aspect-square h-[98%]  " >
                <Logo height="full" width="20" src={bigazeLogo}/>
            </Link>

            {/* Center: Naviagtion bar */}
            <div className="flex-btwn-center px-2 py-1 font-bold gap-10 rounded-full  shadow-md hover:shadow-cyan-200 transition-all duration-200
              border-purple-700 border-2 w-1/2 h-full  ">
              {
                navbarItems.map(navItem => (
                  <NavButton key={navItem.label} label={navItem.label} link={navItem.link}/>
                ))
              }
            </div>


              {/* Right : Signup Buttons */}
            <div className="flex gap-4">

            </div>
    </motion.nav>
  )
}

export default Navbar
