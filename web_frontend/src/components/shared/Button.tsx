import { ButtonProps } from "../../types";
import { cva } from "class-variance-authority";

import { cn } from "@/lib/utils";


const customButtonVariants = cva("flex-between gap-2 border border-zinc-500 hover:border-zinc-300 hover:scale-[1.01] text-sm  whitespace-nowrap rounded-xl  transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50", {
  variants: {
    variant: {
      default: "bg-primary text-primary-foreground hover:bg-primary/90",
      purpleZinc: "rounded bg-gradient-to-r from-purple-900 to-zinc-800",
      indigo:
        "gap-2 bg-gradient-to-r from-purple-800 to-slate-900 via-indigo-900 hover:scale-[1.02] hover:transition-all duration-300 ease-in-out",
    },
    size: {
      default: "h-10 px-4 py-2",
      sm: "h-9 rounded-md px-3",
      lg: "h-11 rounded-md px-8",
      icon: "h-10 w-10",
    },
  },
  defaultVariants: {
    variant: "default",
    size: "default",
  },
});
function Button({
  label,
  handleButtonClick,
  additionalStyles,
  variant,
  size,
  iconSide,
  icon: Icon,
}: ButtonProps) {
  return (
    <button
      className={cn(
        additionalStyles,
        customButtonVariants({ variant, size })
      )}
      onClick={() => {
        handleButtonClick && handleButtonClick();
      }}
    >
      {iconSide === "left" && Icon && <Icon size={16} />}
      {label}
      {iconSide === "right" && Icon && <Icon size={16} />}
    </button>
  );
}

export { Button, customButtonVariants };
