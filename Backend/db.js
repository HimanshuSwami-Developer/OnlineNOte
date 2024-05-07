const mongoose = require('mongoose')
const uri='mongodb+srv://Himanshu:gokuss3@cluster0.nyxl32d.mongodb.net/memo'
    // 'mongodb+srv://Himanshu:gokuss3@oyebusy.aycjwoy.mongodb.net/Oyebusy'
// mongodb+srv://Himanshu:<password>@cluster0.nyxl32d.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0
const connectMongo=()=>{
    mongoose.connect(uri,()=>{
        console.log("connected to mongo");
    })
}
module.exports=connectMongo;
