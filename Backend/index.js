const connecttoMongo=require('./db')
const express = require('express')
const cors=require('cors')
connecttoMongo()

const app = express()
const port = 8080

app.use(cors())
app.use(express.json())

//Available Routes
// app.get('/', (req, res) => {
//   res.send('Hello World!')
// })
app.use('/api/auth',require('./routes/auth'))
app.use('/api/notes',require('./routes/notes'))

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})