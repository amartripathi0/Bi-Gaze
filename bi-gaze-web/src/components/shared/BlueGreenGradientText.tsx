import { cn } from "@/lib/utils";

function BlueGreenGradientText({
  additionalStyles,
  text,
}: {
  text: string;
  additionalStyles?: string;
}) {
  return (
    <h1
      className={cn(
        additionalStyles,
        "text-[5.6vw] leading-[1] font-bold bg-gradient-to-r from-blue-600 via-green-500 to-indigo-400 inline-block text-transparent bg-clip-text"
      )}
    >
      {text}
    </h1>
  );
}

export default BlueGreenGradientText;
