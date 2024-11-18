import { ButtonProps } from "../../types";
function Button({ label, handleButtonClick, additionalStyles }: ButtonProps) {
  return (
    <button
      className={`${additionalStyles} 
     bg-purple-900 h-10 rounded text-white text-lg 
    `}
      onClick={() => {
        handleButtonClick && handleButtonClick();
      }}
    >
      {label}
    </button>
  );
}

export default Button;
