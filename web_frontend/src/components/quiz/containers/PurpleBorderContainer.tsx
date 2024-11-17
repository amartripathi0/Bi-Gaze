import { cn } from "@/utils/utils";

type PurpleBorderProps = {
  children: React.ReactNode;
  additionalStyles: string;
};
function PurpleBorderContainer({
  children,
  additionalStyles,
}: PurpleBorderProps) {
  return (
    <div
      className={cn(
        `shadow-3xl shadow-gray-500 border-purple-900 rounded`,
        additionalStyles
      )}
    >
      {children}
    </div>
  );
}

export default PurpleBorderContainer;
