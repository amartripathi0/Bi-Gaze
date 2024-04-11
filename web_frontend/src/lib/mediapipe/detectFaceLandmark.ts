import { FaceLandmarker, FilesetResolver } from "@mediapipe/tasks-vision";
import { drawMesh } from "./drawMesh";

let lastVideoTime = -1;
let faceLandmarkerResult = undefined;
let isRunning = true;

export const runDetector = async (
  video: HTMLVideoElement,
  canvasRef: HTMLCanvasElement
) => {
  const filesetResolver = await FilesetResolver.forVisionTasks(
    "https://cdn.jsdelivr.net/npm/@mediapipe/tasks-vision@0.10.3/wasm"
  );

  const faceLandmarker = await FaceLandmarker.createFromOptions(
    filesetResolver,
    {
      baseOptions: {
        modelAssetPath: `https://storage.googleapis.com/mediapipe-models/face_landmarker/face_landmarker/float16/1/face_landmarker.task`,
        delegate: "GPU",
      },
      outputFaceBlendshapes: true,
      runningMode: "VIDEO",
      numFaces: 1,
    }
  );

  const detect = async () => {
    if (!isRunning) return;

    const startTimeMs = performance.now();
    if (lastVideoTime !== video.currentTime) {
      lastVideoTime = video.currentTime;
      faceLandmarkerResult = await faceLandmarker.detectForVideo(
        video,
        startTimeMs
      );
      drawMesh(canvasRef, faceLandmarkerResult);
      console.log(faceLandmarkerResult.faceBlendshapes[0]);
    }

    requestAnimationFrame(detect);
  };

  requestAnimationFrame(detect);
};

export const stopDetector = () => {
  isRunning = false;
};
