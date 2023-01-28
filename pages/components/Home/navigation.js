import React from 'react'
import Link from 'next/link'
import { useEffect } from 'react';
const Navbar = () => {
    useEffect(() => {
        const element = document.getElementById("Networkcontent");
        if (element) {
          element.scrollIntoView();
        }
      }, []);

    return (
        <div>
           <div className="navbar">
            
           <a href="#"><button className ="button-78" role="button"> <i></i></button></a>
            <div className="nav-links">  
             <button id="Homecontent" className ="button-10" role="button"><Link href="/">Home</Link></button>
             <button id="Networkcontent"className="button-10" role="button"><Link href="./components/Home/network">Network</Link></button>
             <button id="Jobcontent"className="button-10" role="button"><Link href="./components/Home/Jobs">Jobs</Link></button> 
             <button id="Messagingcontent"className="button-10" role="button"><Link href="./components/Home/messaging">Messaging</Link></button>
             <button id="Notificationcontent" className="button-10" role="button"><Link href="./components/Home/Notification">Notifications</Link></button>
            </div> 
          
        </div>


        </div>
    )
}
 
export default Navbar
    
   
    
    
    