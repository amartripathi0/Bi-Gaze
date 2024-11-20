"use client";

import * as React from "react";
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

import { cn } from "@/lib/utils";
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
  { label: "Dashboard", link: "", icon: <Home className="mr-3 h-4 w-4" /> },
  {
    label: "All Quizzes",
    link: "all-quizzes",
    icon: <ListChecks className="mr-3 h-4 w-4" />,
  },
  {
    label: "Previous Quizzes",
    link: "previous-quizzes",
    icon: <Calendar className="mr-3 h-4 w-4" />,
  },
  {
    label: "Profile",
    link: "profile",
    icon: <User className="mr-3 h-4 w-4" />,
  },
  {
    label: "Notifications",
    link: "notifications",
    icon: <Bell className="mr-3 h-4 w-4" />,
    badge: (
      <Badge className="ml-auto flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-red-500 text-white">
        3
      </Badge>
    ),
  },
  {
    label: "Settings",
    link: "settings",
    icon: <Settings className="mr-3 h-4 w-4" />,
  },
];

export default function Layout({ children }: { children: React.ReactNode }) {
  return (
    <SidebarProvider>
      <div className="grid min-h-screen w-full lg:grid-cols-[280px_1fr] bg-gray-50">
        <Sidebar
          variant="floating"
          collapsible={"icon"}
          className="hidden lg:block bg-white shadow-lg rounded-lg"
        >
          <SidebarHeader className="flex h-[60px] items-center p-4 bg-purple-700 text-white">
            <Link className="flex items-center gap-2 font-semibold" href="#">
              <BookOpen className="h-6 w-6" />
              <span className="">Examinee Portal</span>
            </Link>
          </SidebarHeader>
          <SidebarContent className="flex flex-col gap-4 p-4">
            <nav>
              {sidebarItems.map((item, index) => (
                <Link
                  key={index}
                  href={item.link}
                  className="flex items-center gap-2 p-2 rounded hover:bg-purple-100 transition"
                >
                  {item.icon}
                  {item.label}
                  {item.badge}
                </Link>
              ))}
            </nav>
          </SidebarContent>
          <SidebarFooter>
            <Button
              variant="ghost"
              className="w-full justify-start hover:bg-gray-200 transition"
            >
              <LogOut className="mr-3 h-4 w-4" />
              Log out
            </Button>
          </SidebarFooter>
        </Sidebar>
        <div className="flex flex-col w-full ">
          <header className="flex h-14 lg:h-[60px] items-center gap-4 border-b bg-gray-100 px-6 dark:bg-gray-800">
            <Link className="lg:hidden" href="#">
              <BookOpen className="h-6 w-6" />
              <span className="sr-only">Home</span>
            </Link>
            <div className="w-full flex-1">
              <h1 className="font-semibold text-lg text-gray-800">
                Examinee Dashboard
              </h1>
            </div>
            <SidebarTrigger />
            <Avatar>
              <AvatarImage
                src="/placeholder.svg?height=32&width=32"
                alt="@username"
              />
              <AvatarFallback>CN</AvatarFallback>
            </Avatar>
          </header>
          <main className="flex-1 overflow-y-auto p-4 md:p-6 bg-gray-50">
            {children}
          </main>
        </div>
      </div>
    </SidebarProvider>
  );
}
