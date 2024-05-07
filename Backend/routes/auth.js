const express=require('express')
const { body, validationResult } = require('express-validator');
const bcryptjs=require('bcryptjs')
const User= require('../modals/User');
const fetchuser=require('../middleware/fetchUser')
const Jwt=require('jsonwebtoken')
const router=express.Router()

const Jwt_secret='himanshugokuss3';

// this is for sign up page -no login requied with security no database leakage
router.post('/createUser',[
    body('name').isLength({ min: 3 }),
    body('email').isEmail(),
    body('password').isLength({ min: 5 })],
    async(req,res)=>{

      let success=false;

    console.log(req.body)
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }


//try catch for any internal error

try {
  //check user email is already exist or not
    let user =  await User.findOne({email: req.body.email});
    // console.log(user)
    if(user){
      success=false;
        return res.status(400).json({success,error: "email is already exist"})
     }


     const salt= await bcryptjs.genSalt(10);
     const secPass= await bcryptjs.hash(req.body.password,salt);

     //create new user
    user = await User.create({
        name: req.body.name,
        email: req.body.email,
        password: secPass,
      });

      // This json token we give to user when he sign up in db if he give us token then we available his data
      const data = {
        user:{
          id : user.id
        }
      }
      const authToken= Jwt.sign(data,Jwt_secret)
    //  console.log(authToken)
    success=true;
    res.json({success,authToken})
     
      //we comment this becuz our mongodb index is fill with default copies and showing error new method
    //  res.json(user)
    //   .then(user => res.json(user)).
    //   catch(err=>{console.log(err)
    //   res.json({ error:'please enter unique value',message : err.message})});

  } catch (error) {
      console.error(error.message)
      res.status(400).send('some error occure')
  }

  // now we download bcryptjs for hashing

  })



  
// this is for login requied with security no database leakage
router.post('/login',[
  body('email','enter the email').isEmail(), //in body first is check the email pattern 
  body('password','password  not blanck').exists()],//and second arg after invalid pattern error
  async(req,res)=>{
    
    let success=false;
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
   
    const {email,password} = req.body;
      
    try {
      let user= await User.findOne({email})
      if(!email){
        success=false;
         res.status(400).json({success,error:"please enter the correct values "})
      }
      const passwordCompare=await bcryptjs.compare(password,user.password)
      if(!passwordCompare){
        success=false;
        res.status(400).json({success,error:"please enter the correct values "})
     }

     
      // This json token we give to user when he sign up in db if he give us token then we available his data
      const data = {
        user:{
          id : user.id
        }
      }
      const authToken= Jwt.sign(data,Jwt_secret)
    //  console.log(authToken)
    success=true;
    res.json({success,authToken})
     
    } catch (error) {
      // console.error(error.message)
      res.status(400).send('some error occure') 
    }

  })





// this is for login requied with security no database leakage
router.post('/getdata',fetchuser,async(req,res)=>{

  
  try {
    const userid= req.user.id;
    const user=await User.findById(userid).select('-password')
     res.send(user)
    } catch (error) {
      console.error(error.message)
      res.status(500).send('internal server error occure') 
    }

  })







  module.exports = router;