import { ButtonProps } from "@/types";
import { cn } from "@/lib/utils";

function Button({
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
        "bg-purple-900 h-10 rounded text-white text-lg",
        additionalStyles
      )}
      onClick={handleClick}
    >
      {iconSide === "left" && Icon}
      {label}
      {iconSide === "right" && Icon}
    </button>
  );
}

export default Button;
