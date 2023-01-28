import Navbar from './components/Home/navigation'
import '../styles/globals.css'
 
function MyApp({ Component, pageProps }) {
  return (
    <>
      <Navbar />
      <Component {...pageProps} />
    </>
  )
}
 
export default MyApp
