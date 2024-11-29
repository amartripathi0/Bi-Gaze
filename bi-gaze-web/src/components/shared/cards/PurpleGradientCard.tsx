import React from "react";
import { cn } from "@/lib/utils";

function PurpleGradientCard({
  children,
  className,
}: {
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <div
      className={cn(
        className,
        "text-sm opacity-90 text-justify rounded font-medium w-4/5 hover:shadow-md hover:opacity-100 transition-all duration-150 hover:shadow-purple-500 p-6 bg-gradient-to-r from-purple-900 to-indigo-700"
      )}
    >
      {children}
    </div>
  );
}

export default PurpleGradientCard;
