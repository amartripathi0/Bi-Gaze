import Logo from "../Logo";
import { bigazeLogo, navbarItems } from "../../../constants";
import { Link } from "react-router-dom";
import NavButton from "../NavButton";
import { motion } from "framer-motion";
import useTopScroll from "@/hooks/useTopScroll";
import Button from "../Button";
import { NavHashLink } from "react-router-hash-link";
import { ArrowRight } from "lucide-react";

function Navbar() {
  const scrolled = useTopScroll(10);

  return (
    <motion.nav
      className={`flex-between fixed top-0 left-0 z-50 backdrop-blur-lg  w-screen h-16  py-2 px-20  ${
        scrolled && "border-b border-purple-500 "
      }  `}
      initial={{
        opacity: 0,
        y: -30,
      }}
      animate={{
        opacity: 1,
        y: 0,
      }}
      transition={{ duration: 1 }}
    >
      {/* Left: Bi-Gaze Logo */}
      <Link to={"/"} className="flex items-center text-xs uppercase font-bold  gap-2">
        <Logo height="full" src={bigazeLogo} />
        <h1 className="bg-gradient-to-r from-purple-500 to-indigo-300 text-transparent bg-clip-text">Bi-Gaze</h1>
      </Link>

      {/* Right: Naviagtion bar */}
      <div className="flex-between  py-1 font-bold gap-2 h-full w-2/5 " >
        {navbarItems.map((navItem) => (
          <NavButton
            key={navItem.label}
            label={navItem.label}
            link={navItem.link}
          />
        ))}
        <NavHashLink to ="#contact-us" smooth={true} className={"w-1/4 flex-center gap-1  h-full bg-gradient-to-r from-purple-800 rounded  via-indigo-900 to-purple-900 hover:scale-[1.02]"}>
        <button
          className={"text-xs  uppercase font-bold "}
          >Contact Us
          </button>
          <ArrowRight size={14}/>
        </NavHashLink>
      </div>
    </motion.nav>
  );
}

export default Navbar;
