const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const port = 8080;

app.use(bodyParser.json());

app.get("/", (_, res) => {
  return res.send("health check");
});

app.post('/replace', (req, res) => {
    try {
        const inputText = req.body.inputText;

        if (!inputText) {
            throw new Error("Input text is missing.");
        }

        // Define the find and replace dictionary
        const findReplaceDict = {
            'ABN': 'ABN AMRO',
            'ING': 'ING Bank',
            'Rabo': 'Rabobank',
            'Triodos': 'Triodos Bank',
            'Volksbank': 'de Volksbank',
        };

        // Perform the find and replace
        let outputText = inputText;
        for (const find in findReplaceDict) {
            const replace = findReplaceDict[find];
            outputText = outputText.split(find).join(replace);
        }

        // Create the response
        const responseData = { outputText };
        res.json(responseData);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

app.listen(port, () => {
    console.log(`Server started on port ${port}`);
});