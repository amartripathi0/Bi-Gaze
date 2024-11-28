import {
  Bell,
  BookOpen,
  Calendar,
  Home,
  ListChecks,
  LogOut,
  Settings,
  User,
} from "lucide-react";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarHeader,
  SidebarProvider,
  SidebarTrigger,
} from "@/components/ui/sidebar";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Badge } from "@/components/ui/badge";

const sidebarItems = [
  { label: "Dashboard", link: "", icon: <Home className="mr-3 h-5 w-5" /> },
  {
    label: "All Quizzes",
    link: "dashboard/all-quizzes",
    icon: <ListChecks className="mr-3 h-5 w-5" />,
  },
  {
    label: "Previous Quizzes",
    link: "dashboard/previous-quizzes",
    icon: <Calendar className="mr-3 h-5 w-5" />,
  },
  {
    label: "Profile",
    link: "dashboard/profile",
    icon: <User className="mr-3 h-5 w-5" />,
  },
  {
    label: "Notifications",
    link: "dashboard/notifications",
    icon: <Bell className="mr-3 h-5 w-5" />,
    badge: (
      <Badge className="ml-auto flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-rose-500 text-white">
        3
      </Badge>
    ),
  },
  {
    label: "Settings",
    link: "dashboard/settings",
    icon: <Settings className="mr-3 h-5 w-5" />,
  },
];

export default function Layout({ children }: { children: React.ReactNode }) {
  return (
    <SidebarProvider>
      <div className="grid min-h-screen w-full lg:grid-cols-[280px_1fr] bg-zinc-50 dark:bg-zinc-900">
        <Sidebar
          variant="floating"
          side="left"
          collapsible={"icon"}
          className="hidden lg:block shadow-lg bg-white dark:bg-zinc-950 border-r border-zinc-200 dark:border-zinc-800"
        >
          <SidebarHeader className="flex h-[60px] items-center px-6 bg-gradient-to-r from-purple-600 to-indigo-600 dark:from-purple-900 dark:to-indigo-900 text-white">
            <Link className="flex items-center gap-3 font-semibold" href="#">
              <BookOpen className="h-6 w-6" />
              <span className="text-lg">Examinee Portal</span>
            </Link>
          </SidebarHeader>
          <SidebarContent className="flex flex-col gap-2 p-4">
            <nav className="space-y-1">
              {sidebarItems.map((item, index) => (
                <Link
                  key={index}
                  href={item.link}
                  className="flex items-center gap-2 px-4 py-2.5 rounded-lg hover:bg-purple-50 dark:hover:bg-purple-950/50 transition-colors duration-200 text-zinc-700 dark:text-zinc-200 hover:text-purple-700 dark:hover:text-purple-300"
                >
                  {item.icon}
                  <span className="font-medium">{item.label}</span>
                  {item.badge}
                </Link>
              ))}
            </nav>
          </SidebarContent>
          <SidebarFooter className="border-t border-zinc-200 dark:border-zinc-800 p-4">
            <Button
              variant="ghost"
              className="w-full justify-start text-zinc-700 dark:text-zinc-200 hover:bg-rose-50 hover:text-rose-700 dark:hover:bg-rose-950/50 dark:hover:text-rose-300 transition-colors duration-200"
            >
              <LogOut className="mr-3 h-5 w-5" />
              <span className="font-medium">Log out</span>
            </Button>
          </SidebarFooter>
        </Sidebar>
        <div className="flex flex-col w-full">
          <header className="flex h-14 lg:h-[60px] items-center gap-4 border-b border-zinc-200 dark:border-zinc-800 px-6 bg-white dark:bg-zinc-950 sticky top-0 z-10">
            <Link className="lg:hidden" href="#">
              <BookOpen className="h-6 w-6 text-purple-600 dark:text-purple-400" />
              <span className="sr-only">Home</span>
            </Link>
            <div className="w-full flex-1">
              <h1 className="font-semibold text-lg text-zinc-900 dark:text-zinc-100">
                Examinee Dashboard
              </h1>
            </div>
            <SidebarTrigger className="text-zinc-500 hover:text-zinc-900 dark:text-zinc-400 dark:hover:text-zinc-100" />
            <Avatar className="h-9 w-9 transition-transform hover:scale-105">
              <AvatarImage
                src="/placeholder.svg?height=32&width=32"
                alt="@username"
                className="object-cover"
              />
              <AvatarFallback className="bg-purple-100 dark:bg-purple-900 text-purple-700 dark:text-purple-300">
                CN
              </AvatarFallback>
            </Avatar>
          </header>
          <main className="flex-1 p-6 bg-zinc-50 dark:bg-zinc-900 overflow-auto">
            {children}
          </main>
        </div>
      </div>
    </SidebarProvider>
  );
}
