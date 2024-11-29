import bigazeLogo from "@/public/assets/bi-gaze-logo.png";
import BlueGreenGradientText from "@/components/shared/BlueGreenGradientText";
import PurpleBlur from "@/components/shared/backgrounds/PurpleBlur";
import { User, User2 } from "lucide-react";
import IndigoButton from "@/components/shared/buttons/IndigoButton";
import { MotionDiv } from "@/components/shared/motion";
import Link from "next/link";
import Image from "next/image";

function LandingPage() {
  return (
    <section
      id="/"
      className="flex flex-col md:flex-row md:items-center sm:h-[calc(100vh-4rem)] xl:px-20 py-6 sm:py-0"
    >
      <MotionDiv
        className="md:w-1/2 flex flex-col justify-center gap-2 sm:gap-6"
        initial={{
          opacity: 0,
          x: -100,
        }}
        animate={{
          opacity: 1,
          x: 0,
        }}
        transition={{ duration: 1 }}
      >
        <BlueGreenGradientText additionalStyles="text-4xl md:text-6xl lg:text-8xl">
          Bi-GAZE
        </BlueGreenGradientText>
        <p className="text-sm md:text-base mt-2">
          Real-time, AI-driven monitoring that ensures fairness and integrity
          without compromising the test-taker&apos;s comfort.
        </p>
        <p className="text-sm md:text-base">
          Our system is built to detect and deter any form of dishonesty,
          providing a comprehensive solution that includes identity
          verification, attention tracking, and an array of customizable
          proctoring features.
        </p>

        <div className="flex flex-wrap gap-4 mt-4">
          <Link href={"/examinee/auth/signin"} passHref>
            <IndigoButton label="Examinee Signin" icon={<User size={16} />} />
          </Link>
          <Link href={"/examiner/auth/signin"} passHref>
            <IndigoButton label="Examiner Signin" icon={<User2 size={16} />} />
          </Link>
        </div>
      </MotionDiv>

      <MotionDiv
        className="relative flex-center h-full md:w-1/2 mt-6 sm:mt-0"
        initial={{
          opacity: 0,
          x: 100,
        }}
        animate={{
          opacity: 1,
          x: 0,
        }}
        transition={{ duration: 1 }}
      >
        <PurpleBlur />

        <MotionDiv
          className="flex-col-center text-lg md:text-xl h-3/5 w-full z-20"
          initial={{
            scale: 1,
          }}
          animate={{
            scale: 0.9,
          }}
          transition={{
            duration: 1,
            repeat: Infinity,
            repeatType: "reverse",
            ease: "linear",
          }}
        >
          <Image
            className="aspect-square size-44 sm:h-60 md:size-60 lg:size-80"
            height={600}
            width={600}
            src={bigazeLogo}
            alt="bi-gaze"
          />
          <div className="bottom-0 flex-col-center">
            <p className="text-sm md:text-base">
              AI based{" "}
              <span className="opacity-90 hover:opacity-100 text-cyan-900 dark:text-cyan-200 font-semibold">
                Proctoring System
              </span>{" "}
            </p>
            <p className="text-sm md:text-base">
              Revolutionizing Online Assessment
            </p>
          </div>
        </MotionDiv>
      </MotionDiv>
    </section>
  );
}

export default LandingPage;
