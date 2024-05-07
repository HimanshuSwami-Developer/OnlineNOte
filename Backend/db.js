const mongoose = require('mongoose')
const uri='mongodb+srv://Himanshu:gokuss3@oyebusy.aycjwoy.mongodb.net/Oyebusy'
const connectMongo=()=>{
    mongoose.connect(uri,()=>{
        console.log("connected to mongo");
    })
}
module.exports=connectMongo;