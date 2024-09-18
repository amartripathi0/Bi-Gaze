import { useState } from "react";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Sheet, SheetContent, SheetTrigger } from "@/components/ui/sheet";
import {
  BarChart3,
  BookOpen,
  GraduationCap,
  Menu,
  Settings,
  User,
  Calendar,
  Bell,
  LucideIcon,
} from "lucide-react";
import ExamineeQuizzesDashoard from "@/pages/examinee/quiz/ExamineeQuizzesDashoard";
import { NavLink } from "react-router-dom";
import ExamineeProfile from "./examinee-profile";
import ExamineeSchedule from "./examinee-schedule";
import ExamineeNotifications from "./examinee-notifications";
import ExamineeSettings from "./examinee-settings";
import ExamineeResults from "./examinee-results";

export default function ExamineeDashboard() {
  const [activeTab, setActiveTab] = useState("dashboard");

  const NavItem = ({
    icon: Icon,
    label,
    value,
  }: {
    icon: LucideIcon;
    label: string;
    value: string;
  }) => (
    <NavLink
      to={value}
      className={({ isActive }) =>
        isActive
          ? "text-blue-500 hover:text-blue-700 w-full h-10 px-4 items-center border flex justify-start"
          : "text-gray-600 hover:text-gray-800 w-full h-10 px-4 items-center border flex justify-start"
      }
      onClick={() => setActiveTab(value)}
    >
      <Icon className="mr-2 h-4 w-4" />
      {label}
    </NavLink>
  );

  const Sidebar = () => (
    <div className="hidden border-r bg-gray-100/40 lg:block dark:bg-gray-800/40">
      <div className="flex h-full max-h-screen flex-col gap-2">
        <NavLink
          to={"/examinee/dashboard"}
          className="flex h-[60px] items-center border-b px-6"
        >
          <GraduationCap className="mr-2 h-6 w-6" />
          <span className="font-bold">Examinee Dashboard</span>
        </NavLink>
        <div className="flex-1 overflow-auto py-2">
          <nav className="grid items-start text-sm font-medium">
            <NavItem icon={BarChart3} label="Dashboard" value="dashboard" />
            <NavItem icon={User} label="Profile" value="profile" />
            <NavItem icon={BookOpen} label="Quizzes" value="quizzes" />
            <NavItem icon={GraduationCap} label="Results" value="results" />
            <NavItem icon={Calendar} label="Schedule" value="schedule" />
            <NavItem icon={Bell} label="Notifications" value="notifications" />
            <NavItem icon={Settings} label="Settings" value="settings" />
          </nav>
        </div>
      </div>
    </div>
  );

  const Content = () => (
    <div className="flex flex-col">
      <header className="flex h-14 lg:h-[60px] items-center gap-4 border-b bg-gray-100/40 px-6 dark:bg-gray-800/40">
        <Sheet>
          <SheetTrigger asChild>
            <Button variant="outline" size="icon" className="lg:hidden">
              <Menu className="h-6 w-6" />
              <span className="sr-only">Toggle navigation menu</span>
            </Button>
          </SheetTrigger>
          <SheetContent side="left" className="w-[80%] sm:w-[385px]">
            <div className="grid gap-4 py-4">
              <Sidebar />
            </div>
          </SheetContent>
        </Sheet>
        <div className="flex-1">
          <h1 className="text-lg font-semibold">
            {activeTab.charAt(0).toUpperCase() + activeTab.slice(1)}
          </h1>
        </div>
      </header>
      <main className="flex flex-1 flex-col gap-4 p-4 md:gap-8 md:p-6">
        {activeTab === "dashboard" && (
          <>
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">
                    Total Quizzes
                  </CardTitle>
                  <BookOpen className="h-4 w-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">12</div>
                  <p className="text-xs text-muted-foreground">
                    4 quizzes this week
                  </p>
                </CardContent>
              </Card>
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">
                    Average Score
                  </CardTitle>
                  <BarChart3 className="h-4 w-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">78%</div>
                  <p className="text-xs text-muted-foreground">
                    +5% from last month
                  </p>
                </CardContent>
              </Card>
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">
                    Completed Quizzes
                  </CardTitle>
                  <GraduationCap className="h-4 w-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">8</div>
                  <p className="text-xs text-muted-foreground">
                    2 completed this week
                  </p>
                </CardContent>
              </Card>
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">
                    Upcoming Quizzes
                  </CardTitle>
                  <Calendar className="h-4 w-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">3</div>
                  <p className="text-xs text-muted-foreground">
                    Next quiz in 2 days
                  </p>
                </CardContent>
              </Card>
            </div>
            <Card className="col-span-4">
              <CardHeader>
                <CardTitle>Recent Quizzes</CardTitle>
                <CardDescription>
                  You have taken 3 quizzes in the last 7 days.
                </CardDescription>
              </CardHeader>
              <CardContent>
                <ScrollArea className="h-[300px]">
                  {[...Array(5)].map((_, i) => (
                    <div
                      key={i}
                      className="mb-4 grid grid-cols-[25px_1fr] items-start pb-4 last:mb-0 last:pb-0"
                    >
                      <span className="flex h-2 w-2 translate-y-1 rounded-full bg-sky-500" />
                      <div className="space-y-1">
                        <p className="text-sm font-medium leading-none">
                          Quiz {i + 1}: Introduction to React
                        </p>
                        <p className="text-sm text-muted-foreground">
                          Score: 85% • Completed on May {20 + i}, 2023
                        </p>
                      </div>
                    </div>
                  ))}
                </ScrollArea>
              </CardContent>
            </Card>
          </>
        )}
        {activeTab === "profile" && (
          <Card>
            <CardHeader>
              <CardTitle>User Profile</CardTitle>
              <CardDescription>
                Manage your personal information
              </CardDescription>
            </CardHeader>
            <CardContent>
              <ExamineeProfile />
            </CardContent>
          </Card>
        )}
        {activeTab === "quizzes" && (
          <Card>
            <CardHeader>
              <CardTitle>Available Quizzes</CardTitle>
              <CardDescription>
                Take a new quiz or review past ones
              </CardDescription>
            </CardHeader>
            <CardContent className="flex flex-wrap gap-8">
              <ExamineeQuizzesDashoard />
            </CardContent>
          </Card>
        )}
        {activeTab === "results" && (
          <Card>
            <CardHeader>
              <CardTitle>Quiz Results</CardTitle>
              <CardDescription>
                View your performance across all quizzes
              </CardDescription>
            </CardHeader>
            <CardContent>
              <ExamineeResults />
            </CardContent>
          </Card>
        )}
        {activeTab === "schedule" && (
          <Card>
            <CardHeader>
              <CardTitle>Exam Schedule</CardTitle>
              <CardDescription>View upcoming quizzes and exams</CardDescription>
            </CardHeader>
            <CardContent>
              <ExamineeSchedule />
            </CardContent>
          </Card>
        )}
        {activeTab === "notifications" && (
          <Card>
            <CardHeader>
              <CardTitle>Notifications</CardTitle>
              <CardDescription>
                Stay updated with important announcements
              </CardDescription>
            </CardHeader>
            <CardContent>
              <ExamineeNotifications />
            </CardContent>
          </Card>
        )}
        {activeTab === "settings" && (
          <Card>
            <CardHeader>
              <CardTitle>Account Settings</CardTitle>
              <CardDescription>Manage your account preferences</CardDescription>
            </CardHeader>
            <CardContent>
              <ExamineeSettings />
            </CardContent>
          </Card>
        )}
      </main>
    </div>
  );

  return (
    <div className="grid min-h-screen w-full lg:grid-cols-[280px_1fr]">
      <Sidebar />
      <Content />
    </div>
  );
}
