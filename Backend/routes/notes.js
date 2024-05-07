const express = require('express')
const router = express.Router()
const { body, validationResult } = require('express-validator');
const Notes = require('../modals/Notes');
const fetchuser = require('../middleware/fetchUser')

//fetch the notes from the token of user
router.get('/getnotes', fetchuser, async (req, res) => {
    try {
        const notes = await Notes.find({ user: req.user.id })
        res.json(notes)
    } catch (error) {
        console.error(error.message)
        res.status(500).send('internal server error occure')
    }
})



//Get the notes from the user  ADD notes using post
router.post('/addnotes',fetchuser,
    [body('title', 'enter the title ').isLength({ min: 3 }),
    body('description', 'enter the description valid..').isLength({ min: 5 })], async (req, res) => {

        try {

            const { title, description, tag } = req.body;

            //checker title and description
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                return res.status(400).json({ errors: errors.array() });
            }



            const note = new Notes({
                title, description, tag, user: req.user.id
            })
            const savenote = await note.save()
            res.json(savenote)

        } catch (error) {
            console.error(error.message)
            res.status(500).send('internal server error occure')
        }
    })





//Update the notes from the user existing notes using put
router.put('/updatenotes/:id',fetchuser, async (req, res) => {        

            const { title, description, tag } = req.body;
           const newNote={};
           if(title){newNote.title=title}
           if(description){newNote.description=description}
           if(tag){newNote.tag=tag}

           //find the note id 

           let note= await Notes.findByIdAndUpdate(req.params.id)
           if(!note){return res.status(404).send('not found')}
           if(note.user.toString() !== req.user.id ){return res.status(401).send('not allowed')}
           
           note=await Notes.findByIdAndUpdate(req.params.id,{$set : newNote},{new:true})
           
        res.json(note)
    })



//Delete the notes from the user exist notes using delete
router.delete('/deletenotes/:id',fetchuser, async (req, res) => {        

   //find the note id 

   let note= await Notes.findByIdAndDelete(req.params.id)
   if(!note){return res.status(404).send('not found')}
   if(note.user.toString() !== req.user.id ){return res.status(401).send('not allowed')}
   
   note=await Notes.findByIdAndDelete(req.params.id)
   
   res.json({"Success":"your note is deleted successfully"})

})


module.exports = router;