import { ButtonProps } from "@/types";
import { cn } from "@/lib/utils";
import { Loader } from "lucide-react";

function PurpleZincButton({
  type = "button",
  label,
  handleButtonClick,
  additionalStyles,
  isLoading,
}: ButtonProps) {
  const handleClick = () => {
    if (handleButtonClick) {
      handleButtonClick();
    }
  };

  return (
    <button
      type={type}
      disabled={isLoading}
      className={cn(
        "flex justify-center items-center gap-2 rounded text-sm bg-gradient-to-r dark:text-white text-neutral-800 dark:from-purple-900 dark:to-zinc-900 from-purple-600 to-zinc-300 w-48",
        additionalStyles,
        isLoading ? "opacity-60" : "opacity-100"
      )}
      onClick={handleClick}
    >
      {label}
      {isLoading && <Loader className="animate-spin" size={16} />}
    </button>
  );
}

export default PurpleZincButton;
