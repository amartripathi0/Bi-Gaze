import {
  DrawingUtils,
  FaceLandmarker,
  FaceLandmarkerResult,
} from "@mediapipe/tasks-vision";

export function drawMesh(
  canvasRef: HTMLCanvasElement,
  faceLandmarkerResult: FaceLandmarkerResult
) {
  const ctx = canvasRef.getContext("2d");
  if (ctx !== null) {
    ctx.clearRect(0, 0, canvasRef.width, canvasRef.height);
    const drawingUtils = new DrawingUtils(ctx);
    for (const landmarks of faceLandmarkerResult.faceLandmarks) {
      drawingUtils.drawConnectors(
        landmarks,
        FaceLandmarker.FACE_LANDMARKS_TESSELATION,
        { color: "#C0C0C070", lineWidth: 0.2 }
      );
      drawingUtils.drawConnectors(
        landmarks,
        FaceLandmarker.FACE_LANDMARKS_RIGHT_EYE,
        { color: "#FF3030" , lineWidth : 0.5}
      );
      drawingUtils.drawConnectors(
        landmarks,
        FaceLandmarker.FACE_LANDMARKS_RIGHT_EYEBROW,
        { color: "#FF3030" , lineWidth : 0.5}
      );
      drawingUtils.drawConnectors(
        landmarks,
        FaceLandmarker.FACE_LANDMARKS_LEFT_EYE,
        { color: "#30FF30" , lineWidth : 0.5}
      );
      drawingUtils.drawConnectors(
        landmarks,
        FaceLandmarker.FACE_LANDMARKS_LEFT_EYEBROW,
        { color: "#30FF30" , lineWidth : 0.5}
      );
      drawingUtils.drawConnectors(
        landmarks,
        FaceLandmarker.FACE_LANDMARKS_FACE_OVAL,
        { color: "#E0E0E0" , lineWidth : 0.5}
      );
      drawingUtils.drawConnectors(
        landmarks,
        FaceLandmarker.FACE_LANDMARKS_LIPS,
        {
          color: "#E0E0E0", lineWidth : 0.5,
        }
      );
      drawingUtils.drawConnectors(
        landmarks,
        FaceLandmarker.FACE_LANDMARKS_RIGHT_IRIS,
        { color: "#FF3030" , lineWidth : 0.5}
      );
      drawingUtils.drawConnectors(
        landmarks,
        FaceLandmarker.FACE_LANDMARKS_LEFT_IRIS,
        { color: "#30FF30" , lineWidth : 0.5}
      );
    }
  }
}
