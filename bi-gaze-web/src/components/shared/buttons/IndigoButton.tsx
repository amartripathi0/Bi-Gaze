"use client";
import { ButtonProps } from "@/types";
import { cn } from "@/lib/utils";

function IndigoButton({
  label,
  handleButtonClick,
  additionalStyles,
  iconSide = "right",
  icon: Icon,
}: ButtonProps) {
  const handleClick = () => {
    if (handleButtonClick) {
      handleButtonClick();
    }
  };

  return (
    <button
      className={cn(
        "border-neutral-300 dark:border-indigo-900 border p-3 sm:p-3.5 rounded text-sm font-semibold uppercase text-neutral-800 flex-between dark:text-white gap-2 bg-gradient-to-r from-purple-400 to-slate-200 via-indigo-400 hover:border-purple-500 hover:shadow-xs hover:shadow-purple-500 hover:scale-[1.01] hover:transition-all duration-100 ease-in-out dark:bg-gradient-to-r dark:from-purple-800 dark:to-slate-900 dark:via-indigo-900 dark:hover:border-purple-500 dark:hover:shadow-sm dark:hover:shadow-purple-500 dark:hover:scale-[1.01] dark:hover:transition-all dark:duration-200 dark:ease-in-out",
        additionalStyles,
      )}
      onClick={handleClick}
    >
      {iconSide === "left" && Icon}
      {label}
      {iconSide === "right" && Icon}
    </button>
  );
}

export default IndigoButton;
