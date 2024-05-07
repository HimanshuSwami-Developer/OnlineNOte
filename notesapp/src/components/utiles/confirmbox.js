import React from 'react';
import "./confirmbox.css"
import Dropdown from './dropdownbox';

const ConfirmBox = ({ isOpen, message, onCancel, onConfirm }) => {
  if (!isOpen) {
    return null;
  }

  return (
    <div className="confirm-overlay">
      <div className="confirm-content">
        <p>{message}</p>
        <Dropdown/>
        <div className="button-container">
          <button onClick={onCancel}>Cancel</button>
          <button onClick={onConfirm}>Confirm</button>
        </div>
      </div>
    </div>
  );
};

export default ConfirmBox;
