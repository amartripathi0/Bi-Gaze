"use client";
import { SigninFormData, UserSigninSchema, UserType } from "@/types/index.type";
import FormField from "./FormField";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import PurpleBorderContainer from "@/components/quiz/containers/PurpleBorderContainer";
import PurpleZincButton from "../buttons/PurpleZincButton";
import {
  signInWithEmailAndPassword,
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

function SigninForm({ userType }: { userType: UserType }) {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<SigninFormData>({ resolver: zodResolver(UserSigninSchema) });
  const router = useRouter();
  const [isLoading, setIsLoading] = useState(false);

  const onSubmit = async ({ email, password }: SigninFormData) => {
    setIsLoading(true);
    try {
      const userCredentials = await signInWithEmailAndPassword(
        auth,
        email,
        password
      );
      if (userCredentials.user) {
        router.push(`/${userType}/dashboard`);
      }
    } catch (error) {
      if (error instanceof FirebaseError) {
        console.error("Error", error.code);
      }
    } finally {
      setIsLoading(false);
    }
  };

  const handleGoogleSignIn = async (
    event: React.MouseEvent<HTMLButtonElement>
  ) => {
    event.preventDefault();
    const provider = new GoogleAuthProvider();
    try {
      const { user } = await signInWithPopup(auth, provider);
      await setUserDetails(user, userType);
      router.push(`/${userType}/dashboard`);
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
        <p className="text-sm my-4">
          Don&apos;t have an account?{" "}
          <Link
            href={`/${userType}/auth/signup`}
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
          className="mx-auto py-2 font-semibold uppercase"
        />
        <span className="mx-auto text-sm">or</span>
        <div className="flex items-center justify-center mx-auto text-sm">
          <button
            className="px-4 py-2 border flex items-center gap-2 border-slate-700 rounded hover:border-slate-400 hover:text-neutral-200 hover:shadow transition duration-150"
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
            <span>Sign in with Google</span>
          </button>
        </div>
      </PurpleBorderContainer>
    </form>
  );
}

export default SigninForm;
