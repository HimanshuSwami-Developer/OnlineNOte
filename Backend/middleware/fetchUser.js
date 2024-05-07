const Jwt = require('jsonwebtoken')
const Jwt_secret='himanshugokuss3';

const fetchuser=(req , res , next)=>{
    const token=req.header('auth-token')
    if(!token){
        res.status(401).send({error:"please authenticate using valid token"})
    }
    try {
    const data=Jwt.verify(token,Jwt_secret)
    req.user=data.user
    next();
    } catch (error) {
        res.status(401).send({error:"please authenticate using valid token"})
    }
}
module.exports=fetchuser;
