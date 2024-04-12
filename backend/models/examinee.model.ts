import mongoose from "mongoose";

const examineeSchema = new mongoose.Schema({
  personalDetails: {
    firstName: { type: String, required: true },
    lastName: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    profilePicture: { type: String, default: "" },
  },
  quizzes: [
    {
      quizTitle: { type: String, required: true },
      createdBy: { type: String, required: true },
      quizScore : { type: Number, required: true } ,
      
    },
  ],
});

export const Examinee = mongoose.model("Examinee" , examineeSchema);

