import Link from "next/link";
import { cn } from "@/lib/utils";
import { usePathname } from "next/navigation";

interface NavButtonProps {
  link: string;
  label: string;
}

function NavButton({ link, label }: NavButtonProps) {
  const pathname = usePathname();

  return (
    <Link
      href={link}
      scroll
      className={cn(
        pathname === link
          ? "bg-gradient-to-r from-purple-500 to-indigo-300 text-transparent bg-clip-text opacity-100"
          : "opacity-90",
        "h-4/5 flex-center px-4 text-sm uppercase font-medium transition-all duration-150 hover:bg-gradient-to-r hover:from-purple-800 hover:to-indigo-500 dark:hover:from-purple-400 dark:hover:to-indigo-300 hover:text-transparent hover:bg-clip-text"
      )}
    >
      {label}
    </Link>
  );
}

export default NavButton;
