import Link from "next/link";
import { cn } from "@/lib/utils";
import { useParams, usePathname } from "next/navigation";

interface NavButtonProps {
  link: string;
  label: string;
}
const scrollWithOffset = (el: HTMLElement) => {
  const yCoordinate = el.getBoundingClientRect().top + window.pageYOffset;
  const yOffset = -65;
  window.scrollTo({ top: yCoordinate + yOffset, behavior: "smooth" });
};

function NavButton({ link, label }: NavButtonProps) {
  const pathname = usePathname()
  console.log("pathname" , pathname);
  
  return (
    <Link
      href={link}
      scroll
      className={cn(
        pathname === link
          ? "bg-gradient-to-r from-purple-500 to-indigo-300 text-transparent bg-clip-text opacity-100"
          : "opacity-90",
        "h-4/5 flex-center px-4 text-xs uppercase font-bold transition-all duration-150 hover:bg-gradient-to-r hover:from-purple-500 hover:to-indigo-300 hover:text-transparent hover:bg-clip-text"
      )}
    >
      {label}
    </Link>
  );
}

export default NavButton;
