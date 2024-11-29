import { ButtonProps } from "@/types/index.type";
import { cn } from "@/lib/utils";

function Button({
  label,
  handleButtonClick,
  className,
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
        "bg-purple-900 p-2.5 hover:bg-purple-900/90 w-40 rounded text-white text-base",
        className
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
