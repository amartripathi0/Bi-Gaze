import { useForm } from "react-hook-form";
import { SignupFormData, UserSignupSchema } from "@/types";
import FormField from "./FormField";
import { zodResolver } from "@hookform/resolvers/zod";
import PurpleBorderContainer from "@/components/quiz/containers/PurpleBorderContainer";
import { Link } from "react-router-dom";
import PurpleZincButton from "../buttons/PurpleZincButton";

function SignupForm({ userType }: { userType: string }) {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<SignupFormData>({ resolver: zodResolver(UserSignupSchema) });

  const onSubmit = async (data: SignupFormData) => {
    console.log(data);
  };

  return (
    <div className="flex justify-end items-center h-screen w-screen">
      <form
        onSubmit={handleSubmit(onSubmit)}
        className="w-1/2 h-full flex-center "
      >
        <PurpleBorderContainer additionalStyles="flex-col gap-4 flex p-10  w-2/3 h-5/6 border-2 ">
          <FormField
            type="email"
            placeholder="Email"
            name="email"
            register={register}
            error={errors.email}
          />

          <FormField
            type="text"
            placeholder="First Name"
            name="firstName"
            register={register}
            error={errors.firstName}
          />

          <FormField
            type="text"
            placeholder="Last Name"
            name="lastName"
            register={register}
            error={errors.lastName}
            valueAsNumber
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
              to={"/" + userType + "/signin"}
              replace={true}
              className="text-blue-500 font-medium hover:underline"
            >
              Signin
            </Link>
          </p>

        <PurpleZincButton type="submit" label="Sign Up" additionalStyles="w-1/3 mx-auto py-2 font-semibold uppercase"/>
        </PurpleBorderContainer>
      </form>
    </div>
  );
}

export default SignupForm;
