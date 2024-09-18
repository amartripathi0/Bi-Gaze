import { cn } from "@/lib/utils";
import { ButtonProps } from "@/types";
function IndigoButton({
  label,
  handleButtonClick,
  additionalStyles,
  icon: Icon,
  
}: ButtonProps) {
  return (
    <button
      className={cn(
        "border-indigo-900 border p-4 rounded-xl text-xs font-bold uppercase h-full flex-between gap-2 bg-gradient-to-r from-purple-800 to-slate-900 via-indigo-900 hover:border-purple-500 hover:shadow-sm hover:shadow-purple-500 hover:scale-[1.02] hover:transition-all duration-300 ease-in-out",
        additionalStyles
      )}
      onClick={() => {
        handleButtonClick && handleButtonClick();
      }}
    >
      {Icon && <Icon size={16} />}

      {label}
    </button>
  );
}

export default IndigoButton;
