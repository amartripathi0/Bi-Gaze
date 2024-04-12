import { useForm } from "react-hook-form";
import { SignupFormData , UserSignupSchema} from "@/types";
import FormField from "./FormField";
import { zodResolver } from "@hookform/resolvers/zod";
import PurpleBorderContainer from "@/components/quiz/containers/PurpleBorderContainer";

function SignupForm() {

  const {register , handleSubmit  , formState : {errors}}  = useForm<SignupFormData>({resolver : zodResolver(UserSignupSchema)});
 
  const onSubmit = async (data: SignupFormData) => {
          console.log(data);
          
  }
  
  return (
    <div className="flex justify-end items-center h-screen w-screen"> 
        
        <form onSubmit={handleSubmit(onSubmit)}
        className="w-1/2 h-full flex-center "
        >
        <PurpleBorderContainer additionalStyles="flex-col gap-4 flex p-10  w-2/3 h-4/5 border-2 ">
  
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
          <button type="submit" className="submit-button">
            Submit
          </button>
        </PurpleBorderContainer>
      </form>
    </div>
  )
}

export default SignupForm
