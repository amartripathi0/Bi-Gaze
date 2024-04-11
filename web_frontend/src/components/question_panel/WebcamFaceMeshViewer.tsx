import { runDetector } from "@/lib/mediapipe/detectFaceLandmark";
import React, { useRef, useState } from "react";
import Webcam from "react-webcam";

const videoConstraints = {
  width: 1280,
  height: 720,
  facingMode: "user",
};
interface WebcamFaceMeshViewerProps {
  webcamHeight: string;
  webcamWidth: string;
}

function WebcamFaceMeshViewer({
  webcamHeight,
  webcamWidth,
}: WebcamFaceMeshViewerProps) {
  const canvasRef = useRef(null);
  const [loaded, setLoaded] = useState(false);

  const handleVideoLoad = (
    videoNode: React.SyntheticEvent<HTMLVideoElement>
  ) => {
    const video = videoNode.target as HTMLVideoElement;
    if (video.readyState !== 4) return;
    if (loaded) return;
    runDetector(video, canvasRef.current!);
    setLoaded(true);
  };

  return (
    <div
      className={`h-${webcamHeight} w-${webcamWidth} relative rounded-xl flex-center overflow-hidden`}
    >
      <Webcam
        className="absolute  object-fill h-full "
        videoConstraints={videoConstraints}
        onLoadedData={(vid) => handleVideoLoad(vid)}
      />
      <canvas ref={canvasRef} className="h-full object-fill absolute " />
    </div>
  );
}

export default WebcamFaceMeshViewer;
