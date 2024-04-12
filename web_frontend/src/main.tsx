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
import ExamineeHomepage from "./pages/examinee/ExamineeHomepage.tsx";
import Quiz from "./pages/examinee/quiz/Quiz.tsx";
import ExamineeLayout from "./pages/examiner/ExaminerLayout.tsx";
import ExaminerLayout from "./pages/examiner/ExaminerLayout.tsx";
import ExaminerDashboard from "./pages/examiner/Dashboard.tsx";

const routes = [
  <Route path="/" element={<App />}>
    <Route path="/home" element={<Home />} />
    <Route path="/" element={<Home />} />

    <Route path="/examinee" element={<ExamineeLayout />}>
      <Route path="/examinee" element={<ExamineeHomepage />} />
      <Route path="/examinee/quiz" element={<Quiz />} />
    </Route>

    <Route path="/examiner" element={<ExaminerLayout />}>
      <Route path="/examiner/dashboard" element={<ExaminerDashboard />} />
    </Route>
  </Route>,
];
const router = createBrowserRouter(createRoutesFromElements(routes));

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
