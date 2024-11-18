import { ButtonProps } from "@/types";
import { cn } from "@/utils/utils";
import { Loader } from "lucide-react";

function PurpleZincButton({
  type = "button",
  label,
  handleButtonClick,
  additionalStyles,
  isLoading,
}: ButtonProps) {
  return (
    <button
      type={type}
      disabled={isLoading}
      className={cn(
        "flex justify-center items-center gap-2 rounded text-sm bg-gradient-to-r from-purple-900 to-zinc-800 w-48",
        additionalStyles,
        isLoading ? "opacity-60" : "opacity-100"
      )}
      onClick={() => {
        handleButtonClick && handleButtonClick();
      }}
    >
      {label}
      {isLoading && <Loader className="animate-spin" size={16} />}
    </button>
  );
}

export default PurpleZincButton;
