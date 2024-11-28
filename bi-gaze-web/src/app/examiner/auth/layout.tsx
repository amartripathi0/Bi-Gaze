import Navbar from "@/components/shared/navbar/Navbar";
import { ReactNode } from "react";

export default function layout({ children }: { children: ReactNode }) {
  return (
    <section>
      <Navbar />
      {children}
    </section>
  );
}
