import express, { Express, Request, Response } from "express";
import dotenv from "dotenv";


const app: Express = express();
// const port = process.env.PORT || 3000;

app.get("/", (req: Request, res: Response) => {
  res.send("Express + TypeScript Server");
});

app.listen(5000, () => {
  console.log(`[server]: Server is running at http://localhost:${5000}`);
});
