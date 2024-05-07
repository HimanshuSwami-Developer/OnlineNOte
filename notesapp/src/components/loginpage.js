import React, { useState } from 'react';
import './LoginPage.css'; // Import the CSS file for styling
import { Navigate, useNavigate } from 'react-router-dom';
import { signInWithEmailAndPassword } from "firebase/auth";
import { auth } from "../components/firebase";
// import firebase from 'firebase';

const LoginPage = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const navigate=useNavigate();

  const handleEmailChange = (e) => {
    setEmail(e.target.value);
  };

  const handlePasswordChange = (e) => {
    setPassword(e.target.value);
  };

  const handleLogin = (e) => {
    e.preventDefault();
    // Perform login logic here
    console.log('Logging in...');
  };



 const getdata=()=>{
    signInWithEmailAndPassword(auth,email, password).then(async(res)=>{
        console.log("signin");
        navigate("/");
    }).catch(function(error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        console.log(errorCode);
        console.log(errorMessage);
    });

    //    console.log(email+password);

}

  return (
    <div className='Container'>
    <div className="container">
      {/* <h2>Login</h2> */}
      <form onSubmit={handleLogin}>
        <div className="form-group">
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            value={email}
            onChange={handleEmailChange}
          />
        </div>
        <div className="form-group">
          <label htmlFor="password">Password:</label>
          <input
            type="password"
            id="password"
            value={password}
            onChange={handlePasswordChange}
          />
        </div>
        <button type="submit" onClick={getdata}>Login</button>
      </form>
    </div>
    </div>
  );
};

export default LoginPage;
