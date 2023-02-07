const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const appExpress = express();
const PORT = 3000;
const DB =
  "mongodb+srv://Ashwini:Ashika1807@cluster0.ndnyibb.mongodb.net/?retryWrites=true&w=majority";
appExpress.use(express.json());
appExpress.use(authRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

appExpress.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
