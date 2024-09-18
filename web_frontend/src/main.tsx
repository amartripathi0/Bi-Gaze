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

import Quiz from "./pages/examinee/quiz/Quiz.tsx";
import ExaminerLayout from "./pages/examiner/ExaminerLayout.tsx";
import ExaminerDashboard from "./pages/examiner/Dashboard.tsx";
import ExamineeSignup from "./pages/examinee/auth/ExamineeSignup.tsx";
import ExamineeSignin from "./pages/examinee/auth/ExamineeSignin.tsx";
import ExaminerSignup from "./pages/examiner/auth/ExaminerSignup.tsx";
import ExaminerSignin from "./pages/examiner/auth/ExaminerSignin.tsx";
import ExamineeQuizzesDashoard from "./pages/examinee/quiz/ExamineeQuizzesDashoard.tsx";
import ExamineeDashboard from "./pages/examinee/examiniee-dashboard.tsx";
import ExamineeProfile from "./pages/examinee/examinee-profile.tsx";
import ExamineeResults from "./pages/examinee/examinee-results.tsx";
import ExamineeSchedule from "./pages/examinee/examinee-schedule.tsx";
import ExamineeNotifications from "./pages/examinee/examinee-notifications.tsx";
import ExamineeSettings from "./pages/examinee/examinee-settings.tsx";

const routes = [
  <Route path="/" element={<App />}>
    <Route path="/home" element={<Home />} />
    <Route path="/" element={<Home />} />

    <Route path="/examinee/signup" element={<ExamineeSignup />} />
    <Route path="/examinee/signin" element={<ExamineeSignin />} />
    <Route path="/examinee" element={<ExamineeDashboard />}>
      <Route path="/examinee/dashboard" element={<ExamineeDashboard />} />
      <Route path="/examinee/profile" element={<ExamineeProfile />} />
      <Route path="/examinee/quizzes" element={<ExamineeQuizzesDashoard />} />
      <Route path="/examinee/results" element={<ExamineeResults />} />
      <Route path="/examinee/schedule" element={<ExamineeSchedule />} />
      <Route
        path="/examinee/notifications"
        element={<ExamineeNotifications />}
      />
      <Route path="/examinee/settings" element={<ExamineeSettings />} />
    </Route>
    <Route path="/examinee/quizzes/quiz/:quizId" element={<Quiz />} />

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
