import express from 'express';


const app = express();
app.use(express.json());

app.get('/', (req, res) => {
  res.send('Hello from Product Service!');
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Product Service is running on port ${PORT}`);
});