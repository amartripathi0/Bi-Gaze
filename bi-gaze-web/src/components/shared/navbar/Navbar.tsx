"use client";
import Logo from "../Logo";
import { navbarItems } from "../../../constants";
import NavButton from "../NavButton";
import useTopScroll from "@/hooks/useTopScroll";
import { ArrowRight, Menu, X } from "lucide-react";
import Link from "next/link";
import { cn } from "@/lib/utils";
import { MotionNav, MotionDiv } from "../motion";
import bigazeLogo from "@/public/assets/bi-gaze-logo.png";
import { ModeToggle } from "@/components/theme-toggle";
import { useState } from "react";

function Navbar() {
  const scrolled = useTopScroll(10);
  const [isOpen, setIsOpen] = useState(false);

  const toggleMenu = () => {
    setIsOpen(!isOpen);
  };

  return (
    <MotionNav
      className={cn(
        "flex-between fixed top-0 left-0 z-50 backdrop-blur-lg w-screen h-14 sm:h-16 py-2 px-4 md:px-20",
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
      <Link
        href={"/"}
        className="flex items-center text-xs md:text-sm uppercase font-bold gap-2"
      >
        <Logo height={20} src={bigazeLogo} />
        <h1 className="bg-gradient-to-r dark:from-purple-500 dark:to-indigo-300 from-purple-800 to-indigo-600 text-transparent bg-clip-text text-lg md:text-xl">
          Bi-Gaze
        </h1>
      </Link>
      <div className="flex items-center h-full md:hidden gap-2">
        <ModeToggle />
        <button onClick={toggleMenu} className="text-black dark:text-white">
          <Menu size={28} />
        </button>
      </div>
      {isOpen && (
        <MotionDiv
          className="fixed top-0 right-0 w-full h-full dark:bg-gray-800 shadow-lg z-50 flex flex-col p-4"
          initial={{ x: 300, opacity: 0 }}
          animate={{ x: 0, opacity: 1 }}
          exit={{ x: 300, opacity: 0 }}
          transition={{ duration: 0.3 }}
        >
          <button
            onClick={toggleMenu}
            className="self-end text-black dark:text-white"
          >
            <X size={28} />
          </button>
          <div className="flex flex-col mt-4 bg-neutral-900 h-96">
            {navbarItems.map((navItem, index) => (
              <MotionDiv
                key={navItem.label}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.3, delay: index * 0.1 }}
              >
                <Link
                  href={navItem.link}
                  className="block px-4 py-2 text-sm text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700 transition-colors"
                >
                  {navItem.label}
                </Link>
              </MotionDiv>
            ))}
          </div>
        </MotionDiv>
      )}
      <div
        className={cn(
          "hidden md:flex items-center py-1 font-bold gap-4 md:gap-6 h-full"
        )}
      >
        {navbarItems.map((navItem) => (
          <NavButton
            key={navItem.label}
            label={navItem.label}
            link={navItem.link}
            className="transition-transform duration-300 transform hover:scale-105"
          />
        ))}

        <ModeToggle />

        <Link
          href="#contact-us"
          scroll
          className={cn(
            "group px-4 md:px-5 flex-center gap-1 h-full bg-gradient-to-r from-purple-800 to-purple-900 rounded via-indigo-900 dark:from-purple-600 dark:to-purple-800 dark:via-indigo-700"
          )}
        >
          <button className="text-xs md:text-sm uppercase font-bold text-white dark:text-gray-200">
            Contact Us
          </button>
          <ArrowRight
            size={16}
            className="text-white dark:text-gray-200 group-hover:translate-x-1 duration-200 font-bold transition-transform"
          />
        </Link>
      </div>
    </MotionNav>
  );
}

export default Navbar;
