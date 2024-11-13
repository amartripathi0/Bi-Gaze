import { useForm } from "react-hook-form";
import { SignupFormData, UserSignupSchema } from "@/types";
import FormField from "./FormField";
import { zodResolver } from "@hookform/resolvers/zod";
import PurpleBorderContainer from "@/components/quiz/containers/PurpleBorderContainer";
import { Link } from "react-router-dom";
import PurpleZincButton from "../buttons/PurpleZincButton";
import {
  createUserWithEmailAndPassword,
  updateProfile,
  signInWithPopup,
  GoogleAuthProvider,
} from "firebase/auth";
import { auth } from "../../../firebase";

const provider = new GoogleAuthProvider();

function SignupForm({ userType }: { userType: string }) {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<SignupFormData>({ resolver: zodResolver(UserSignupSchema) });

  const onSubmit = async ({ email, password }: SignupFormData) => {
    try {
      const userCredential = await createUserWithEmailAndPassword(
        auth,
        email,
        password
      );
      await updateProfile(userCredential.user, { displayName: userType });
    } catch (error) {
      console.error("Error signing up:", error);
    }
  };

  const handleGoogleSignIn = async () => {
    try {
      const userCredential = await signInWithPopup(auth, provider);
      await updateProfile(userCredential.user, { displayName: userType });
    } catch (error) {
      console.error("Error during Google sign-in:", error);
    }
  };

  return (
    <form
      onSubmit={handleSubmit(onSubmit)}
      className="flex justify-center items-center h-screen"
    >
      <PurpleBorderContainer additionalStyles="flex-col gap-2 flex p-6 w-1/2 max-w-md">
        <FormField
          type="email"
          placeholder="Email"
          name="email"
          register={register}
          error={errors.email}
        />

        <FormField
          type="password"
          placeholder="Password"
          name="password"
          register={register}
          error={errors.password}
        />

        <FormField
          type="password"
          placeholder="Confirm Password"
          name="confirmPassword"
          register={register}
          error={errors.confirmPassword}
        />

        <p className="text-sm my-4">
          Already have an account?{" "}
          <Link
            to={`/${userType}/signin`}
            replace={true}
            className="text-blue-500 font-medium hover:underline"
          >
            Signin
          </Link>
        </p>

        <PurpleZincButton
          type="submit"
          label="Sign Up"
          additionalStyles=" mx-auto py-2 font-semibold uppercase"
        />
        <span className="mx-auto text-sm">or</span>
        <div className="flex items-center justify-center mx-auto text-sm">
          <button
            className="px-4 py-2 border flex gap-2 border-slate-200 rounded hover:border-slate-400 hover:text-neutral-200 hover:shadow transition duration-150"
            onClick={handleGoogleSignIn}
          >
            <img
              className="w-4 h-4"
              src="https://www.svgrepo.com/show/475656/google-color.svg"
              loading="lazy"
              alt="google logo"
            />
            <span>Signup with Google</span>
          </button>
        </div>
      </PurpleBorderContainer>
    </form>
  );
}

export default SignupForm;
