import { FormFieldProps } from "@/types";

function FormField({
  type,
  placeholder,
  name,
  register,
  error,
}: FormFieldProps) {
  return (
    <div className="flex flex-col gap-2 ">

      <label className="text-md" htmlFor={name}>{placeholder}</label>
      <input
        type={type}
        placeholder={`Please enter your ${placeholder.toLocaleLowerCase()}`}
        className="bg-transparent h-10 border p-2 text-sm rounded flex-center"
        {...register(name)}
      />
      {error && <span className="text-sm text-red-400">{error.message}</span>}
    </div>
  );
}

export default FormField;
