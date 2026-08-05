import express from 'express';


const app = express();
app.use(express.json());


app.get('/auth', (req, res) => {
  res.send('Hello from Auth Service!');
});

app.get('/health', (req, res) => {
  res.status(200).send('Auth Service is healthy!');
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Auth Service is running on port ${PORT}`);
});