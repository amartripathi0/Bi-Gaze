import Logo from "@/components/shared/Logo";
import { bigazeLogo } from "@/constants";
import PurpleGradientCard from "@/components/shared/cards/PurpleGradientCard";
import BlueGreenGradientText from "@/components/shared/BlueGreenGradientText";
import PurpleBlur from "@/components/shared/backgrounds/PurpleBlur";
import { User, UserSquareIcon } from "lucide-react";
import { motion } from "framer-motion";
import IndigoButton from "@/components/shared/buttons/IndigoButton";
import { useNavigate } from "react-router-dom";

function LandingPage() {
  const navigate = useNavigate();
  return (
    <div id="/" className="flex-between h-screen -mt-16 mx-20 ">
      {/* left side  */}
      <motion.div
        className=" w-3/5 flex flex-col justify-center h-full gap-6"
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
        <span className="text-xl leading-[0.1]">Welcome to</span>

        <BlueGreenGradientText text="Bi-GAZE" />
        <PurpleGradientCard>
          <p>
            Real-time, AI-driven monitoring that ensures fairness and integrity
            without compromising the test-taker's comfort.
          </p>
        </PurpleGradientCard>
        <PurpleGradientCard>
          <p>
            Our system is built to detect and deter any form of dishonesty,
            providing a comprehensive solution that includes identity
            verification, attention tracking, and an array of customizable
            proctoring features.
          </p>
        </PurpleGradientCard>

        {/* Login buttons */}
        <div className="flex gap-10 mt-4">
          <IndigoButton
            label="Examinee Signin"
            icon={User}
            handleButtonClick={() => {
              navigate("/examinee/signin");
            }}
          />
          <IndigoButton
            label="Examiner Signin"
            icon={UserSquareIcon}
            handleButtonClick={() => {
              navigate("/examiner/signin");
            }}
          />
        </div>
      </motion.div>

      {/* right side */}
      <motion.div
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
        <motion.div
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
          <Logo height="full" width="full" src={bigazeLogo} />
          <div className=" bottom-0 flex-col-center">
            <h1>
              AI based{" "}
              <span className="opacity-90 hover:opacity-100 text-cyan-200 font-semibold">
                Proctoring System
              </span>{" "}
            </h1>
            <h1>Revolutionizing Online Assessment</h1>
          </div>
        </motion.div>
      </motion.div>
    </div>
  );
}

export default LandingPage;
