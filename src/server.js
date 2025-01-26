const express = require("express");
const bodyParser = require("body-parser");

const app = express();
const PORT = 3000;

app.use(bodyParser.json());

// Endpoint for calculating the split
app.post("/api/split", (req, res) => {
  const { totalBill, people, isEqualSplit, customAmounts, tipPercentage } =
    req.body;

  if (!totalBill || !people || people.length === 0) {
    return res.status(400).send("Invalid input");
  }

  let results = [];
  const tip = (tipPercentage / 100) * totalBill;
  const totalWithTip = totalBill + tip;

  if (isEqualSplit) {
    const amountPerPerson = parseFloat(
      (totalWithTip / people.length).toFixed(2)
    );
    results = people.map((person) => ({
      name: person,
      amount: amountPerPerson,
    }));
  } else if (customAmounts && customAmounts.length === people.length) {
    const totalCustomAmounts = customAmounts.reduce((sum, amt) => sum + amt, 0);
    const tipShareFactor = tip / totalCustomAmounts;

    results = people.map((person, index) => ({
      name: person,
      amount: parseFloat(
        (customAmounts[index] + customAmounts[index] * tipShareFactor).toFixed(
          2
        )
      ),
    }));
  } else {
    return res.status(400).send("Custom amounts are invalid or incomplete.");
  }

  res.json({
    totalBill,
    tip,
    totalWithTip,
    splitDetails: results,
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
