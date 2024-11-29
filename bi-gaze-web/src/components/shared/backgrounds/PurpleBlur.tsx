import { cn } from "@/lib/utils";

function PurpleBlur({ className }: { className?: string }) {
  return (
    <div
      className={cn(
        className,
        "absolute w-60 aspect-square blur-[80px] opacity-80 rounded-full bg-purple-500"
      )}
    />
  );
}

export default PurpleBlur;
