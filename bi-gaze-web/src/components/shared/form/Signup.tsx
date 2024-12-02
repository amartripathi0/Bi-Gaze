"use client";
import { useForm } from "react-hook-form";
import { SignupFormData, UserSignupSchema, UserType } from "@/types/index.type";
import FormField from "./FormField";
import { zodResolver } from "@hookform/resolvers/zod";
import PurpleBorderContainer from "@/components/quiz/containers/PurpleBorderContainer";
import PurpleZincButton from "../buttons/PurpleZincButton";
import {
  createUserWithEmailAndPassword,
  signInWithPopup,
  GoogleAuthProvider,
} from "firebase/auth";
import { auth } from "@/lib/firebase";
import { useState } from "react";
import { FirebaseError } from "firebase/app";
import Link from "next/link";
import { useRouter } from "next/navigation";
import Image from "next/image";
import { setUserDetails } from "@/utils/setUserDetails";

function SignupForm({ userType }: { userType: UserType }) {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<SignupFormData>({ resolver: zodResolver(UserSignupSchema) });
  const router = useRouter();
  const [isLoading, setIsLoading] = useState(false);

  const onSubmit = async ({ email, password }: SignupFormData) => {
    try {
      setIsLoading(true);
      const userCredentials = await createUserWithEmailAndPassword(
        auth,
        email,
        password
      );
      setIsLoading(false);
      console.log("userCredentials", userCredentials);

      if (userCredentials.user) {
        await setUserDetails(userCredentials.user, userType);
        // router.push(`/${userType}/dashboard`);
      }
    } catch (error) {
      setIsLoading(false);
      if (error instanceof FirebaseError) {
        console.error("Error", error.code);
      }
    }
  };

  const handleGoogleSignIn = async (
    event: React.MouseEvent<HTMLButtonElement>
  ) => {
    event.preventDefault();
    const provider = new GoogleAuthProvider();
    try {
      const { user } = await signInWithPopup(auth, provider);
      if (user) {
        await setUserDetails(user, userType);
        router.push(`/${userType}/dashboard`);
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
      <PurpleBorderContainer className="flex-col gap-2 flex p-6 w-1/2 max-w-sm">
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
            href={`/${userType}/auth/signin`}
            replace={true}
            className="text-blue-500 font-medium hover:underline"
          >
            Signin
          </Link>
        </p>

        <PurpleZincButton
          isLoading={isLoading}
          type="submit"
          label="Sign Up"
          className=" mx-auto py-2 font-semibold uppercase"
        />
        <span className="mx-auto text-sm">or</span>
        <div className="flex items-center justify-center mx-auto text-sm">
          <button
            className="px-4 py-2 border flex gap-2 border-slate-200 rounded hover:border-slate-400 hover:text-neutral-200 hover:shadow transition duration-150"
            onClick={handleGoogleSignIn}
          >
            <Image
              className="w-4 h-4"
              src="https://www.svgrepo.com/show/475656/google-color.svg"
              loading="lazy"
              alt="google logo"
              width={20}
              height={20}
            />
            <span>Signup with Google</span>
          </button>
        </div>
      </PurpleBorderContainer>
    </form>
  );
}

export default SignupForm;
