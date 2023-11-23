# API for find and replacing special keywords.


### How to test the API.

```
curl -X POST -H "Content-Type: application/json" -d '{"inputText": "The analysts of ABN did a great job!"}' https://api.anuraggautam.nl/replace

curl -X POST -H "Content-Type: application/json" -d '{"inputText": "The analysts of ING did a great job!"}' https://api.anuraggautam.nl/replace

curl -X POST -H "Content-Type: application/json" -d '{"inputText": "The analysts of Rabo did a great job!"}' https://api.anuraggautam.nl/replace

curl -X POST -H "Content-Type: application/json" -d '{"inputText": "The analysts of Triodos did a great job!"}' https://api.anuraggautam.nl/replace

curl -X POST -H "Content-Type: application/json" -d '{"inputText": "The analysts of Volksbank did a great job!"}' https://api.anuraggautam.nl/replace
```