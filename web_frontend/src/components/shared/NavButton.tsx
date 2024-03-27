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
  
      className={`${hash === link ? "bg-gradient-to-r from-purple-900 to-indigo-700" : "bg-gray-800"} 
      w-1/3 h-4/5 hover:bg-purple-900 flex-center rounded-full transition-all duration-150`}
    >
      <Button className="text-xl">{label}</Button>
    </NavHashLink>
  );
}

export default NavButton;
