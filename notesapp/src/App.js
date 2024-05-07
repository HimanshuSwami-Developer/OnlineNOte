
import Navbar from './components/navbar';
import Header from './components/header';
import './App.css';
import {useEffect, useState} from 'react'
import { auth } from './components/firebase';
import LoginPage from "./components/loginpage";
import { BrowserRouter as Router, Routes,Route} from "react-router-dom";
import Home from './components/Home';
import Notes from './components/notes';

function App() {
  
  const [Authicate, setAuthicate] = useState("")
  
 useEffect(() => {

   auth.onAuthStateChanged((user)=>{
  // console.log(user);
  if(user){
    setAuthicate(user.displayName);
  }else setAuthicate("");
   });
 }, [])
 
 
  return (
   <>
   
   
   <Router>
   <Header/>
   <Navbar/>  

    <Routes>
   <Route path='/login' element={<LoginPage/>}></Route>
   <Route path='/' element={<Home/>}></Route>
   <Route path='/notes' element={<Notes value={true}/>}></Route>
   </Routes>
   </Router>
   
   </>
  );
}

export default App;
