# API for find and replacing special keywords.

Developed the API using the express node.js framework.
Deployed the API as a docker image to the EKS using the Helm Charts.

### How to test the API.

```
curl -X POST -H "Content-Type: application/json" -d '{"inputText": "The analysts of ABN did a great job!"}' https://api.anuraggautam.nl/replace

curl -X POST -H "Content-Type: application/json" -d '{"inputText": "The analysts of ING did a great job!"}' https://api.anuraggautam.nl/replace

curl -X POST -H "Content-Type: application/json" -d '{"inputText": "The analysts of Rabo did a great job!"}' https://api.anuraggautam.nl/replace

curl -X POST -H "Content-Type: application/json" -d '{"inputText": "The analysts of Triodos did a great job!"}' https://api.anuraggautam.nl/replace

curl -X POST -H "Content-Type: application/json" -d '{"inputText": "The analysts of Volksbank did a great job!"}' https://api.anuraggautam.nl/replace
```

## List of Tools used
- Helm package Manager
- AWS LB Controller
- Docker
- EKS
- GitHub Actions
- Terraform
- S3 bucket and DynamoDb for Terraform state.

## API Helm Chart directory structure

```
string-tmnl/
  ├── charts/
  ├── templates/
      ├── deployment.yaml
      ├── service.yaml
      ├── ingress.yaml
      ├── _helpers.tpl
  └── values.yaml
  └── Chart.yaml

```