"use client";
import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";

export default function Timer({ quizTime }: { quizTime: number }) {
  const [time, setTime] = useState(quizTime); // Initialize time with quizTime
  const router = useRouter();

  useEffect(() => {
    if (time <= 0) {
      router.push(`result`);
    }

    const intervalId = setInterval(() => {
      setTime((prevTime) => {
        if (prevTime <= 1) {
          clearInterval(intervalId);
          return 0; // Prevent negative time
        }
        return prevTime - 1;
      });
    }, 1000);

    return () => clearInterval(intervalId);
  }, [time, router]); // Add time and router to dependencies

  const min = Math.floor(time / 60);
  const sec = time % 60;

  return (
    <div className="border p-2 rounded px-3 bg-neutral-900">
      {min} : {sec < 10 ? `0${sec}` : sec}
    </div>
  );
}
