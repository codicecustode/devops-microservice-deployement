import express from 'express';


const app = express();
app.use(express.json());


app.get('/', (req, res) => {
  res.send('Hello from Auth Service!');
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Auth Service is running on port ${PORT}`);
});