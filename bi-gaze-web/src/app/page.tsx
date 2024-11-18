import AboutBigaze from "@/blocks/homepages/about_bigaze/AboutBigaze";
import AboutUs from "@/blocks/homepages/about_us/AboutUs";
import ContactUs from "@/blocks/homepages/contact_us/ContactUs";
import LandingPage from "@/blocks/homepages/landing_page/LandingPage";
import Navbar from "@/components/shared/navbar/Navbar";

export default function Home() {
  return (
    <>
      <Navbar />
      <main className="h-[calc(100vh-4rem)]  px-24">
        <LandingPage />
        <AboutBigaze />
        <AboutUs />
        <ContactUs />
      </main>
    </>
  );
}
