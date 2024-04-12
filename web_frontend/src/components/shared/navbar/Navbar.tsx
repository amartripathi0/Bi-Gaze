import Logo from "../Logo";
import { bigazeLogo, navbarItems } from "../../../constants";
import { Link } from "react-router-dom";
import NavButton from "../NavButton";
import { motion } from "framer-motion";
import useTopScroll from "@/hooks/useTopScroll";
import Button from "../Button";

function Navbar() {
  const scrolled = useTopScroll(10);

  return (
    <motion.nav
      className={`flex-between fixed top-0 left-0 z-50 backdrop-blur-lg  w-screen h-16  py-4 px-20  ${
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
      <div className="flex-between  py-1 font-bold gap-5 h-full w-1/2" >
        {navbarItems.map((navItem) => (
          <NavButton
            key={navItem.label}
            label={navItem.label}
            link={navItem.link}
          />
        ))}

        <Button
          label="Social"
          additionalStyles={"text-xs w-1/6 uppercase font-bold "}
          handleButtonClick={() => {}}
        />
      </div>
    </motion.nav>
  );
}

export default Navbar;
