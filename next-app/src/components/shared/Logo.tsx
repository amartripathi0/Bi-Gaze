import Image, { StaticImageData } from "next/image";

type LogoProps = {
  height?: number;
  width?: number;
  src: string | StaticImageData;
  alt?: string;
};
function Logo({ height = 40, width = 40, src, alt = "logo" }: LogoProps) {
  return (
    <Image
      className="aspect-square"
      height={height}
      width={width}
      src={src}
      alt={alt}
    />
  );
}

export default Logo;
