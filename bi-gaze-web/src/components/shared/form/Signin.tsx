import { SigninFormData, UserSigninSchema, UserType } from "@/types";
import FormField from "./FormField";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import PurpleBorderContainer from "@/components/quiz/containers/PurpleBorderContainer";
import { Link, useNavigate } from "react-router-dom";
import PurpleZincButton from "../buttons/PurpleZincButton";
import {
  signInWithEmailAndPassword,
  signInWithPopup,
  GoogleAuthProvider,
} from "firebase/auth";
import { auth } from "../../../firebase";
import { useState } from "react";
import { FirebaseError } from "firebase/app";

function SigninForm({ userType }: { userType: UserType }) {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<SigninFormData>({ resolver: zodResolver(UserSigninSchema) });
  const navigate = useNavigate();
  const [isLoading, setIsLoading] = useState(false);
  const onSubmit = async ({ email, password }: SigninFormData) => {
    try {
      setIsLoading(true);
      const userCredentials = await signInWithEmailAndPassword(
        auth,
        email,
        password
      );
      setIsLoading(false);

      if (userCredentials.user) {
        navigate(`/${userType}`);
      }
    } catch (error) {
      setIsLoading(false);
      if (error instanceof FirebaseError) {
        console.error("Errr", error.code);
      }
    }
  };

  const handleGoogleSignIn = async () => {
    const provider = new GoogleAuthProvider();
    try {
      const { user } = await signInWithPopup(auth, provider);
      if (user) {
        navigate(`/${userType}`);
      }
    } catch (error) {
      console.error("Error signing in with Google:", error);
    }
  };

  return (
    <form
      onSubmit={handleSubmit(onSubmit)}
      className="flex justify-center items-center h-screen"
    >
      <PurpleBorderContainer additionalStyles="flex-col gap-2 flex p-6 w-1/2 max-w-sm">
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

        <p className="text-sm my-4">
          Don't have an account?{" "}
          <Link
            to={`/${userType}/signup`}
            replace={true}
            className="text-blue-500 font-medium hover:underline"
          >
            Signup
          </Link>
        </p>

        <PurpleZincButton
          isLoading={isLoading}
          type="submit"
          label="Sign In"
          additionalStyles="mx-auto py-2 font-semibold uppercase"
        />
        <span className="mx-auto text-sm">or</span>
        <div className="flex items-center justify-center mx-auto text-sm">
          <button
            className="px-4 py-2 border flex items-center gap-2 border-slate-700 rounded hover:border-slate-400 hover:text-neutral-200 hover:shadow transition duration-150"
            onClick={handleGoogleSignIn}
          >
            <img
              className="w-4 h-4"
              src="https://www.svgrepo.com/show/475656/google-color.svg"
              loading="lazy"
              alt="google logo"
            />
            <span>Sign in with Google</span>
          </button>
        </div>
      </PurpleBorderContainer>
    </form>
  );
}

export default SigninForm;
