import { SigninFormData, UserSigninSchema } from '@/types';
import FormField from "./FormField";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from 'react-hook-form';
function SigninForm() {
    const {register , handleSubmit  , formState : {errors}}  = useForm<SigninFormData>({resolver : zodResolver(UserSigninSchema)});
 
    const onSubmit = async (data: SigninFormData) => {
            console.log(data);
            
    }
  return (
    <div className="flex-center"> 
        
    <form onSubmit={handleSubmit(onSubmit)}>
    <div className="flex flex-col gap-4">

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

      <button type="submit" className="submit-button">
        Submit
      </button>
    </div>
  </form>
</div>
  )
}

export default SigninForm
