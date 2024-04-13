import { FormFieldProps } from "@/types";

function FormField({
  type,
  placeholder,
  name,
  register,
  error,
}: FormFieldProps) {
  return (
    <div className="flex flex-col gap-1">

      <label className="text-sm" htmlFor={name}>{placeholder}</label>
      <input
        type={type}
        placeholder={`Please enter your ${placeholder.toLocaleLowerCase()}`}
        className="bg-transparent h-8 border p-2 text-xs rounded flex-center"
        {...register(name)}
      />
      {<span className={`text-xs text-red-400 h-2`}>{error?.message}</span>}
    </div>
  );
}

export default FormField;
