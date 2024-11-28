import { cn } from "@/lib/utils";

function BlueGreenGradientText({
  additionalStyles,
  children,
}: {
  children: string;
  additionalStyles?: string;
}) {
  return (
    <h1
      className={cn(
        "font-extrabold bg-gradient-to-r from-blue-700 via-green-600 dark:from-blue-600 dark:via-green-300 to-indigo-400 text-8xl text-transparent bg-clip-text",
        additionalStyles
      )}
    >
      {children}
    </h1>
  );
}

export default BlueGreenGradientText;
