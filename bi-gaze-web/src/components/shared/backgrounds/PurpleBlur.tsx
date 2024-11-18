import { cn } from "@/lib/utils";

function PurpleBlur({ additionalStyles }: { additionalStyles?: string }) {
  return (
    <div 
      className={cn(
        additionalStyles,
        "absolute w-60 aspect-square blur-[80px] opacity-80 rounded-full bg-purple-500"
      )}
    />
  )
}

export default PurpleBlur
