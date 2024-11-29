import { cn } from "@/lib/utils";

function BlueGreenGradientText({
  className,
  children,
}: {
  children: string;
  className?: string;
}) {
  return (
    <h1
      className={cn(
        "font-extrabold bg-gradient-to-r from-blue-700 via-green-600 dark:from-blue-600 dark:via-green-300 to-indigo-400 text-8xl text-transparent bg-clip-text",
        className
      )}
    >
      {children}
    </h1>
  );
}

export default BlueGreenGradientText;
