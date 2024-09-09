import { FaceLandmarkerResult } from "@mediapipe/tasks-vision";

interface CheatingDetectionResult {
  isCheating: boolean;
  confidence: number;
  reasons: string[];
}

const GAZE_THRESHOLD = 0.3; // Adjust based on testing
const HEAD_ROTATION_THRESHOLD = 30; // Degrees
const MOUTH_MOVEMENT_THRESHOLD = 0.2; // Adjust based on testing

export function detectCheating(result: FaceLandmarkerResult): CheatingDetectionResult {
  if (!result.faceLandmarks || result.faceLandmarks.length === 0) {
    return { isCheating: false, confidence: 0, reasons: ["No face detected"] };
  }

  const landmarks = result.faceLandmarks[0];
  const blendshapes = result.faceBlendshapes && result.faceBlendshapes[0] ? result.faceBlendshapes[0].categories : [];

  let isCheating = false;
  let confidence = 0;
  const reasons: string[] = [];

  // Check gaze direction
  const leftEye = landmarks[33];
  const rightEye = landmarks[263];
  const nose = landmarks[1];
  
  const gazeX = (leftEye.x + rightEye.x) / 2 - nose.x;
  const gazeY = (leftEye.y + rightEye.y) / 2 - nose.y;

  if (Math.abs(gazeX) > GAZE_THRESHOLD || Math.abs(gazeY) > GAZE_THRESHOLD) {
    isCheating = true;
    confidence += 0.3;
    reasons.push("Suspicious gaze direction");
  }

  // Check head rotation
  const headRotation = blendshapes.find(b => b.categoryName === "headYaw");
  if (headRotation && Math.abs(headRotation.score) > HEAD_ROTATION_THRESHOLD) {
    isCheating = true;
    confidence += 0.3;
    reasons.push("Excessive head rotation");
  }

  // Check for mouth movement (potential talking)
  const mouthMovement = blendshapes.find(b => b.categoryName === "mouthOpen");
  if (mouthMovement && mouthMovement.score > MOUTH_MOVEMENT_THRESHOLD) {
    isCheating = true;
    confidence += 0.2;
    reasons.push("Possible talking detected");
  }

  // Additional checks could be added here, such as:
  // - Frequency of head movements
  // - Presence of other objects or people in frame
  // - Sudden changes in lighting or background

  // Normalize confidence
  confidence = Math.min(confidence, 1);

  return { isCheating, confidence, reasons };
}

// Usage in your main detection loop:
// const cheatingResult = detectCheating(faceLandmarkerResult);
// if (cheatingResult.isCheating) {
//   console.log("Potential cheating detected:", cheatingResult.reasons);
//   // Trigger alert or logging mechanism
// }
