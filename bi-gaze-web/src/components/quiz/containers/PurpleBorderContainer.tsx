import { cn } from "@/lib/utils";

type PurpleBorderProps = {
  children: React.ReactNode;
  className: string;
};
function PurpleBorderContainer({ children, className }: PurpleBorderProps) {
  return (
    <div
      className={cn(
        `shadow-3xl shadow-gray-500 border border-purple-900 rounded`,
        className
      )}
    >
      {children}
    </div>
  );
}

export default PurpleBorderContainer;
