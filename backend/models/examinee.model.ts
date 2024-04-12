import mongoose from "mongoose";

const examineeSchema = new mongoose.Schema({
  personalDetails: {
    firstName: { type: String, required: true },
    lastName: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    profilePicture: { type: String, default: "" },
  },
  quizs: [
    {
      quizTitle: { type: String, required: true },
      createdBy: { type: String, required: true },
      questions: [
        {
          id: { type: Number, required: true },
          questionTitle: { type: String, required: true },
          options: [
            { type: String, required: true },
            { type: String, required: true },
            { type: String, required: true },
            { type: String, required: true },
          ],
          answer: { type: String, required: true },
        },
      ],
    },
  ],
});

export const Examinee = mongoose.model("Examinee" , examineeSchema);

