import { initializeApp } from "firebase/app";
import {getAuth} from 'firebase/auth'
const firebaseConfig = {
  apiKey: "AIzaSyC9xgBugItKeYdhiOqMOjVULxnoW0NUx3g",
  authDomain: "notesapp-ed8c4.firebaseapp.com",
  projectId: "notesapp-ed8c4",
  storageBucket: "notesapp-ed8c4.appspot.com",
  messagingSenderId: "368096772970",
  appId: "1:368096772970:web:06d4c4d58e3327b972db13",
  measurementId: "G-LPBGRX9HKW"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

    const auth =getAuth();

    export {auth,app};