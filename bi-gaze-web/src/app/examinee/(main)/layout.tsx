import { getAllQuizzes } from "@/actions/quiz";
import {
  dehydrate,
  HydrationBoundary,
  QueryClient,
} from "@tanstack/react-query";

export default async function Layout({ children }: { children: React.ReactNode }) {
  const query = new QueryClient();

  // prefetching and storing data in state
    await query.prefetchQuery({
      queryKey: ["quizzes"],
      queryFn: () => getAllQuizzes(),
    });
  return (
    <HydrationBoundary state={dehydrate(query)}>{children}</HydrationBoundary>
  );
}
