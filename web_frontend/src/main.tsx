import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App.tsx";
import "./index.css";
import {
  createBrowserRouter,
  createRoutesFromElements,
  Route,
  RouterProvider,
} from "react-router-dom";
import Home from "./pages/homepages/home/Home.tsx";
import ExamineeHomepage from "../../bi-gaze-web/src/blocks/examinee/ExamineeHomepage.tsx";
import Quiz from "../../my-app/src/app/examinee/quiz/Quiz.tsx";
import ExamineeLayout from "../../bi-gaze-web/src/blocks/examiner/ExaminerLayout.tsx";
import ExaminerLayout from "../../bi-gaze-web/src/blocks/examiner/ExaminerLayout.tsx";
import ExaminerDashboard from "../../bi-gaze-web/src/blocks/examiner/Dashboard.tsx";
import ExamineeSignup from "../../my-app/src/app/examinee/auth/signup/page.tsx";
import ExamineeSignin from "../../my-app/src/app/examinee/auth/signin/page.tsx";
import ExaminerSignup from "../../bi-gaze-web/src/blocks/examiner/auth/ExaminerSignup.tsx";
import ExaminerSignin from "../../bi-gaze-web/src/blocks/examiner/auth/ExaminerSignin.tsx";
import ExamineeQuizzesDashoard from "../../my-app/src/app/examinee/quiz/ExamineeQuizzesDashoard.tsx";

const routes = [
  <Route path="/" element={<App />}>
    <Route path="/home" element={<Home />} />
    <Route path="/" element={<Home />} />

    <Route path="/examinee" element={<ExamineeLayout />}>
      <Route path="/examinee" element={<ExamineeHomepage />} />
      <Route path="/examinee/signup" element={<ExamineeSignup />} />
      <Route path="/examinee/signin" element={<ExamineeSignin />} />
      <Route path="/examinee/quizzes" element={<ExamineeQuizzesDashoard />} />
      <Route path="/examinee/quizzes/quiz/:quizId" element={<Quiz />} />
    </Route>

    <Route path="/examiner" element={<ExaminerLayout />}>
      <Route path="/examiner/dashboard" element={<ExaminerDashboard />} />
      <Route path="/examiner/signup" element={<ExaminerSignup />} />
      <Route path="/examiner/signin" element={<ExaminerSignin />} />
    </Route>
  </Route>,
];
const router = createBrowserRouter(createRoutesFromElements(routes));

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
