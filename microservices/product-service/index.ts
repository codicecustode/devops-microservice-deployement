import express from 'express';


const app = express();
app.use(express.json());

app.get('/products', (req, res) => {
  res.send('Hello from Product Service!');
});

app.get('/health', (req, res) => {
  res.status(200).send('Product Service is healthy!');
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Product Service is running on port ${PORT}`);
});