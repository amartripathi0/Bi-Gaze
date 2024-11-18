import Logo from "@/components/shared/Logo";
import bigazeLogo from "@/public/assets/bi-gaze-logo.png";
import PurpleGradientCard from "@/components/shared/cards/PurpleGradientCard";
import BlueGreenGradientText from "@/components/shared/BlueGreenGradientText";
import PurpleBlur from "@/components/shared/backgrounds/PurpleBlur";
import { User, UserSquareIcon } from "lucide-react";
import IndigoButton from "@/components/shared/buttons/IndigoButton";
import { MotionDiv } from "@/components/shared/motion";
import Link from "next/link";

function LandingPage() {
  return (
    <section id="/" className="flex-between h-screen overflow-x-hidden px-20">
      {/* left side  */}
      <MotionDiv
        className=" w-1/2 flex flex-col justify-center gap-6"
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
        <BlueGreenGradientText text="Bi-GAZE" />
        {/* <PurpleGradientCard> */}
        <p>
          Real-time, AI-driven monitoring that ensures fairness and integrity
          without compromising the test-taker&apos;s comfort.
        </p>
        {/* </PurpleGradientCard> */}
        {/* <PurpleGradientCard> */}
        <p>
          Our system is built to detect and deter any form of dishonesty,
          providing a comprehensive solution that includes identity
          verification, attention tracking, and an array of customizable
          proctoring features.
        </p>
        {/* </PurpleGradientCard> */}

        {/* Login buttons */}
        <div className="flex gap-10 mt-4">
          <Link href={"/examinee/signin"} passHref>
            <IndigoButton label="Examinee Signin" icon={<User />} />
          </Link>
          <Link href={"/examiner/signin"} passHref>
            <IndigoButton label="Examiner Signin" icon={<UserSquareIcon />} />
          </Link>
        </div>
      </MotionDiv>

      {/* right side */}
      <MotionDiv
        className="relative  flex-center h-full"
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

        {/* logo and text */}
        <MotionDiv
          className="flex-col-center text-xl h-3/5 w-full  z-20"
          initial={{
            scale: 1,
          }}
          animate={{
            scale: 0.9,
          }}
          whileHover={{ rotate: "1deg" }}
          transition={{
            duration: 1,
            repeat: Infinity,
            repeatType: "reverse",
            ease: "linear",
          }}
        >
          <Logo height={300} width={300} alt="bi-gaze" src={bigazeLogo} />
          <div className=" bottom-0 flex-col-center">
            <p>
              AI based{" "}
              <span className="opacity-90 hover:opacity-100 text-cyan-200 font-semibold">
                Proctoring System
              </span>{" "}
            </p>
            <p>Revolutionizing Online Assessment</p>
          </div>
        </MotionDiv>
      </MotionDiv>
    </section>
  );
}

export default LandingPage;
