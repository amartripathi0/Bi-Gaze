import { SigninFormData, UserSigninSchema } from "@/types";
import FormField from "./FormField";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import PurpleBorderContainer from "@/components/quiz/containers/PurpleBorderContainer";
import { Link } from "react-router-dom";
function SigninForm({ userType }: { userType: string }) {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<SigninFormData>({ resolver: zodResolver(UserSigninSchema) });

  const onSubmit = async (data: SigninFormData) => {
    console.log(data);
  };
  return (
    <div className="flex justify-end items-center h-screen w-screen">
      <form
        onSubmit={handleSubmit(onSubmit)}
        className="w-1/2 h-full flex-center "
      >
        <PurpleBorderContainer additionalStyles="flex-col justify-center gap-5 flex p-10  w-2/3 h-4/5 border-2 ">
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
          <p>
            Don't have an account?{" "}
            <Link
              to={"/" + userType + "/signup"}
              replace={true}
              className="text-blue-500 font-medium hover:underline"
            >
              Signup
            </Link>
          </p>
          <button type="submit" className="submit-button">
            Submit
          </button>
        </PurpleBorderContainer>
      </form>
    </div>
  );
}

export default SigninForm;
