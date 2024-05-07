import {React,useEffect,useState} from 'react';
import './navbar.css';
import home from "../images/home.png";
import { auth } from './firebase';
import notes from "../images/notes.png";
import result from "../images/result.png";
import Logout from "../images/logout.png";
import {Link} from "react-router-dom";
import account from "../images/account.png";
import { signOut } from 'firebase/auth';



const VerticalNavbar = () => {
  
  const [isAuth, setisAuth] = useState(false)
  useEffect(() => {
    auth.onAuthStateChanged((user)=>{
      // setAuthicate(user.displayName)
      setisAuth(true)
      
    })
  }, [])
  
  const logout=()=>{
   signOut(auth).then((res)=>{
    setisAuth(false)
   }).catch((error) => {
    // An error happened.

  });
   
  }

  return (
    <div className="vertical-navbar">
       <nav>
      <ul>
        <li>
        {/* <i class="fas fa-home home-icon"></i> */}
        <Link to="/"><img src={home} alt="" width={80} /></Link>
        </li>
      

       {isAuth? 
       <li> <Link to="/login"><img onClick={logout} src={Logout} alt="" width={80} /></Link> </li>        
       : <li> <Link to="/login"><img src={account} alt="" width={80} /></Link> </li> }
        
      
        <li>
        <Link to="/result"><img src={result} alt="" width={80} /></Link>
        </li>
        
        <li>
        <Link to="/notes"><img src={notes} alt="" width={80} /></Link>
        </li>
      </ul>
    </nav>
    </div>
  );
};

export default VerticalNavbar;
