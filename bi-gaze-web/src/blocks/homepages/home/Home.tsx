import Navbar from "../../../components/shared/navbar/Navbar";
import AboutBigaze from "../about_bigaze/AboutBigaze";
import AboutUs from "../about_us/AboutUs";
import ContactUs from "../contact_us/ContactUs";
import LandingPage from "../landing_page/LandingPage";

function Home() {
  return (
    <section className=" w-full  ">
      <Navbar  />
      <div className=" h-[calc(100vh-4rem)]  mt-20 px-24">
        <LandingPage/>
        {/* <AboutBigaze/>
        <AboutUs/>
        <ContactUs/> */}
      </div>
    </section>
  );
}

export default Home;
