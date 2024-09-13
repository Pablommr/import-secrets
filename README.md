# import-secrets

Action to export all secrets in "Environment secrets" to environment variables inside actions in all steps in job.

<br>

# Example
```yml
name: Build

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Import secrets
        uses: Pablommr/import-secrets@v1.0.0
        env:
          ALL_SECRETS: ${{ toJson(secrets) }}
```


<br>

# Usage
To use this action, you just need set an environment and an env 'ALL_SECRETS' with the value '${{ toJson(secrets) }}'. So then, the secrets will be availible in environment variables inside your action in all steps inside the job =).