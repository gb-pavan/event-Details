const express = require('express');
const cors = require('cors');



const app = express();
const port = 3005;

app.use(cors());
app.use(express.json());


// start the server
app.listen(port, () => {
  console.log(`Server listening on port ${port}.`);
});


app.get("/", (request, response) => {
  response.send("Welcome, Hello World!");
});



// initialize the database connection
const sqlite3 = require('sqlite3').verbose();
const path = require('path');
const dbPath = path.resolve(__dirname, 'eventdetails.db');

const db = new sqlite3.Database(dbPath, err => {
  if (err) {
    return console.error(err.message);
  }
  console.log('Connected to the SQLite eventdetails Database.');
});



const corsOptions = {
  origin: 'http://localhost:3005',
  optionsSuccessStatus: 200 
}

app.use('/api', cors(corsOptions));


app.use((req, res, next) => {
  res.setHeader('Content-Security-Policy', "default-src 'self' data:;"); // Set CSP header
  next();
});


// API endpoint to get a specific event by ID or get list of events based on page number
app.get('/api/v3/app/events', async (req, res) => {

  if (Object.keys(req.query).length === 1){
    console.log('inside 1')
    const {id} = req.query
    const eventQuery = `SELECT * FROM eventdetails WHERE uid = ?`;
    const eventDetails = await new Promise((resolve, reject) => {
      db.all(eventQuery, [parseInt(id)], (err, rows) => {
        if (err) {
          reject(err);
        } else {
          resolve(rows);
        }
      });
    });
    console.log('event details',eventDetails)
    res.send(eventDetails)

  }
  else{
    console.log('inside 3')
    const { type,page, limit } = req.query;
    const pageNumber = parseInt(page) || 1;
    const eventsPerPage = parseInt(limit) || 4;
    const offset = (pageNumber - 1) * eventsPerPage;

    // Retrieve the latest updated rows with pagination
    const query = `SELECT * FROM eventdetails ORDER BY schedule DESC LIMIT ?, ?`;
    db.all(query, [offset, eventsPerPage], (error, rows) => {
      if (error) {
        console.log(error);
        res.status(500).send({ error: 'Internal server error' });
      } else {
        res.send(rows);
      }
    });

  }
  
  
});


// API endpoint to update a specific event by ID
app.put('/api/v3/app/event/:id', (req, res) => {
  const { id } = req.params;
  console.log('checking',req.body)
  const { type, name, tagline, schedule, description, files, moderator, category, sub_category, rigor_type, attendees } = req.body;

  const updateQuery = `UPDATE eventdetails SET type = ?, name = ?, tagline = ?, schedule = ?, description = ?, files = ?, moderator = ?, category = ?, sub_category = ?, rigor_type = ?, attendees = ? WHERE uid = ?`;

  new Promise((resolve, reject) => {
    db.run(
      updateQuery,
      [type, name, tagline, schedule, description, files, moderator, category, sub_category, rigor_type, JSON.stringify(attendees), parseInt(id)],
      function (error) {
        if (error) {
          reject(error);
        } else {
          resolve(this);
        }
      }
    );
  })
    .then(() => {
      res.json({ message: 'Event updated successfully' });
    })
    .catch((error) => {
      console.log(error);
      res.status(500).json({ error: 'Internal server error' });
    });
});







// API endpoint to delete a specific event by ID
app.delete('/api/v3/app/event/:id', async (req, res) => {
  const { id } = req.params;

  
    // Delete the event with the specified UID
    const deleteQuery = `DELETE FROM eventdetails WHERE uid = ?`;
    await db.run(deleteQuery, [parseInt(id)]);
    
    res.send({ message: 'Event deleted successfully' });    
  
});



  