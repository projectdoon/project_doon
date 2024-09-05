const app =require('./app');
const db=require('./config/db') 
const UserModel=require('./models/user_model')

const port =3000;

app.get('/',(req,res)=>{
    res.send("hello world!!bye")
});

app.listen(port,()=>{
    console.log(`server listening on port http://localhost:${port}`);
})