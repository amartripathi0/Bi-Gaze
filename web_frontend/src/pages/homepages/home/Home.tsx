// import Logo from '@/components/shared/Logo'
import Navbar from '../../../components/shared/navbar/Navbar'
import AboutBigaze from '../about_bigaze/AboutBigaze'
import AboutUs from '../about_us/AboutUs'
import ContactUs from '../contact_us/ContactUs'
import LandingPage from '../landing_page/LandingPage'
// import { bigazeLogo } from '@/constants'
// import PurpleGradientCard from '@/components/shared/cards/PurpleGradientCard'
// import BlueGreenGradientText from '@/components/shared/BlueGreenGradientText'
// import PurpleBlur from '@/components/shared/backgrounds/PurpleBlur'
// import PurpleButton from '@/components/shared/buttons/PurpleButton'
// import { User, UserSquareIcon } from 'lucide-react'

function Home() {
  return (
    <section className='h-full  w-full px-20  relative'>
        <Navbar />

        {/* Landing Page */}
        <LandingPage/>
        <AboutBigaze/>
        <AboutUs/>
        <ContactUs/>



        


    </section>
  )
}

export default Home
