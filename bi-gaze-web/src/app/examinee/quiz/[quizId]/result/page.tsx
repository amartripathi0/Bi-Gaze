
export default function page({ params: { quizId } }: { params: { quizId: string } }) {
  return <div>{quizId}</div>;
}

