import { z, ZodType } from "zod";
import { LucideIcon } from "lucide-react";
import { FieldError, UseFormRegister } from "react-hook-form";

export type QuizProp = {
  quizId: number;
  quizTitle: string;
  quizDescription: string;
  totalMarks: number;
  createdBy: string;
  questions: QuestionProp[];
};
export type QuestionProp = {
  id: number;
  title: string;
  options: string[];
  answer: string;
};

export type ButtonProps = {
  type?: "button" | "submit" | "reset";
  label: string;
  handleButtonClick?:
    | (() => void)
    | ((e?: React.FormEvent<HTMLFormElement>) => void);
  additionalStyles?: string;
  icon?: LucideIcon;
  variant: "purpleZinc" | "default" | "indigo";
  size: "default" | "lg" | "sm";
  iconSide ?: 'left' | 'right'
};

export interface ExamineeTestResponse extends QuestionProp {
  selectedOption: string;
}

export interface SigninFormData {
  email: string;
  password: string;
}

export interface SignupFormData extends SigninFormData {
  firstName?: string;
  lastName?: string;
  confirmPassword?: string;
}

export type ValidFieldNames =
  | "firstName"
  | "lastName"
  | "email"
  | "password"
  | "confirmPassword";

export type FormFieldProps = {
  type: string;
  placeholder: string;
  name: ValidFieldNames;
  register: UseFormRegister<SignupFormData | SigninFormData>;
  error: FieldError | undefined;
  valueAsNumber?: boolean;
};

export const UserSigninSchema: ZodType<SigninFormData> = z.object({
  email: z.string().email(),
  password: z
    .string()
    .min(6, { message: "Password is too short" })
    .max(20, { message: "Password is too long" }),
});

export const UserSignupSchema: ZodType<SignupFormData> = z
  .object({
    firstName: z
      .string()
      .min(3, { message: "Please enter a valid First Name" }),
    lastName: z.string().min(3, { message: "Please enter a valid Last Name" }),
    email: z.string().email(),
    password: z
      .string()
      .min(6, { message: "Password is too short" })
      .max(20, { message: "Password is too long" }),
    confirmPassword: z.string(),
  })
  .refine((data) => data.password === data.confirmPassword, {
    message: "Passwords do not match",
    path: ["confirmPassword"],
  });
