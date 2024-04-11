import { Button } from "../ui/button";
import { NavHashLink } from "react-router-hash-link";
import { useLocation } from "react-router-dom";

interface NavButtonProps {
  link: string;
  label: string;
}

function NavButton({ link, label }: NavButtonProps) {
  // To be completed : Naviagtion button is active state colour change
  const { hash } = useLocation();
  
  return (
    <NavHashLink
      to={link}
      smooth={true}
      className={`${hash === link ? "bg-gradient-to-r from-purple-500 to-indigo-300 text-transparent bg-clip-text opacity-100" : "opacity-90"} 
      h-4/5 flex-center text-xs uppercase font-bold transition-all duration-150`}
    >
      {label}
    </NavHashLink>
  );
}

export default NavButton;
