"use client";
import { ButtonProps } from "@/types";
import { cn } from "@/lib/utils";

function IndigoButton({
  label,
  handleButtonClick,
  additionalStyles,
  icon: Icon,
}: ButtonProps) {
  return (
    <button
      className={cn(
        additionalStyles,
        "border-indigo-900 border p-3 rounded text-sm font-semibold uppercase flex-between gap-2 bg-gradient-to-r from-purple-800 to-slate-900 via-indigo-900 hover:border-purple-500 hover:shadow-sm hover:shadow-purple-500 hover:scale-[1.01] hover:transition-all duration-200 ease-in-out"
      )}
      onClick={handleButtonClick}
    >
      {Icon}
      {label}
    </button>
  );
}

export default IndigoButton;
