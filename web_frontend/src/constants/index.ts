import { QuizProp } from "../types";
import brandLogo from "./assets/bi-gaze-logo.png";

export const bigazeLogo = brandLogo;
export const socialMedia = [
  {
    name: "Amar",
    social: [
      {
        name: "linkedin",
        href: "",
      },
      {
        github: "github",
        href: "",
      },
    ],
  },
  {
    name: "Nayan",
    social: [
      {
        name: "linkedin",
        href: "",
      },
      {
        github: "github",
        href: "",
      },
    ],
  },
];

export const navbarItems = [
  {
    label: "Home",
    link: "#/",
  },
  {
    label: "About Bigaze",
    link: "#about-bigaze",
  },
  {
    label: "About Us",
    link: "#about-us",
  },
];
export const quizArray: QuizProp = {
  quizTitle: "General Knowledge",
  createdBy: "Prof. ABC",
  questions: [
    {
      id: 1,
      title: "What is the capital of India?",
      options: ["Delhi", "Mumbai", "Jaipur", "Kerala"],
      answer: "Delhi",
    },
    {
      id: 2,
      title: "Who wrote 'Romeo and Juliet'?",
      options: [
        "Charles Dickens",
        "William Shakespeare",
        "Leo Tolstoy",
        "J.K. Rowling",
      ],
      answer: "William Shakespeare",
    },
    {
      id: 3,
      title: "What is the largest planet in our Solar System?",
      options: ["Earth", "Mars", "Jupiter", "Saturn"],
      answer: "Jupiter",
    },
    {
      id: 4,
      title: "What is the chemical symbol for gold?",
      options: ["Au", "Ag", "Fe", "O"],
      answer: "Au",
    },
    {
      id: 5,
      title: "Who painted the Mona Lisa?",
      options: [
        "Vincent Van Gogh",
        "Pablo Picasso",
        "Leonardo da Vinci",
        "Michelangelo",
      ],
      answer: "Leonardo da Vinci",
    },
    {
      id: 6,
      title: "What is the hardest natural substance on Earth?",
      options: ["Gold", "Iron", "Diamond", "Quartz"],
      answer: "Diamond",
    },
    {
      id: 7,
      title: "What is the capital of France?",
      options: ["Lyon", "Marseille", "Paris", "Nice"],
      answer: "Paris",
    },
    {
      id: 8,
      title: "How many continents are there?",
      options: ["5", "6", "7", "8"],
      answer: "7",
    },
    {
      id: 9,
      title: "What is the largest ocean on Earth?",
      options: [
        "Atlantic Ocean",
        "Indian Ocean",
        "Arctic Ocean",
        "Pacific Ocean",
      ],
      answer: "Pacific Ocean",
    },
    {
      id: 10,
      title: "Who is known as the father of computers?",
      options: ["Charles Babbage", "Alan Turing", "Bill Gates", "Steve Jobs"],
      answer: "Charles Babbage",
    },
  ],
};
