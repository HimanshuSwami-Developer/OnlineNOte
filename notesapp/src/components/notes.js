import {React,useState} from 'react'
import "./notes.css";
import ConfirmBox from '../components/utiles/confirmbox';
import {  useNavigate } from 'react-router-dom';


function Notes({value}) {
    const [isOpen, setIsOpen] = useState(value);
    const navigate=useNavigate();

  const closeConfirmBox = () => {
    setIsOpen(false);
    navigate("/");
  };

  const handleConfirm = () => {
    // Handle the confirmation action
    console.log("Confirmed");
    setIsOpen(false);
  };


  return (
    

    
    <>  <h1 class="beautiful-heading">Notes & Lab Manuals</h1>
    
    <div className='Container'>

    {/* <button onClick={openConfirmBox}>Open Confirm Box</button> */}
      
    
    
    </div>
    
    <ConfirmBox
        isOpen={isOpen}
        message="Are you sure you want to proceed?"
        onCancel={closeConfirmBox}
        onConfirm={handleConfirm}
      />
    

    

    
  
    </>
  )
}

export default Notes