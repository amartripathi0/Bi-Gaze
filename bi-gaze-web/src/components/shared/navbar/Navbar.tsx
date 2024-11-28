"use client";
import Logo from "../Logo";
import { navbarItems } from "../../../constants";
import NavButton from "../NavButton";
import useTopScroll from "@/hooks/useTopScroll";
import { ArrowRight } from "lucide-react";
import Link from "next/link";
import { cn } from "@/lib/utils";
import { MotionNav } from "../motion";
import bigazeLogo from "@/public/assets/bi-gaze-logo.png";
import { ModeToggle } from "@/components/theme-toggle";

function Navbar() {
  const scrolled = useTopScroll(10);

  return (
    <MotionNav
      className={cn(
        "flex-between fixed top-0 left-0 z-50 backdrop-blur-lg w-screen h-16 py-2 px-20",
        scrolled && "border-b border-purple-500"
      )}
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
      <Link
        href={"/"}
        className="flex items-center text-sm uppercase font-bold gap-2"
      >
        <Logo height={20} src={bigazeLogo} />
        <h1 className="bg-gradient-to-r dark:from-purple-500 dark:to-indigo-300 from-purple-800 to-indigo-600 text-transparent bg-clip-text">
          Bi-Gaze
        </h1>
      </Link>
      {/* Right: Navigation bar */}
      <div className={cn("flex-between py-1 font-bold gap-2 h-full w-2/5")}>
        {navbarItems.map((navItem) => (
          <NavButton
            key={navItem.label}
            label={navItem.label}
            link={navItem.link}
          />
        ))}
        <ModeToggle />

        <Link
          href="#contact-us"
          scroll
          className={cn(
            "w-1/4 flex-center gap-1 h-full bg-gradient-to-r from-purple-800 to-purple-900 rounded via-indigo-900 hover:scale-[1.02] dark:from-purple-600 dark:to-purple-800 dark:via-indigo-700"
          )}
        >
          <button className="text-xs uppercase font-bold text-white dark:text-gray-200">Contact Us</button>
          <ArrowRight size={14} className="text-white dark:text-gray-200" />
        </Link>
      </div>
    </MotionNav>
  );
}

export default Navbar;
