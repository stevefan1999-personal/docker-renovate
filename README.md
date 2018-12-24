# stevefan1999/renovate

A dead-simple Dockerfile for using Renovate inside Docker container

## How to use
You'll need to either mount your `RENOVATE_CONFIG_FILE` file (which's mounted as `/tmp/renovate.json`), or use an inline `RENOVATE_CONFIG` config (by default an empty JSON object `{}`)

Then you can either 
1. Run the container manually
2. Run the container with a scheduled CRON job in host (recommended)
3. Use this repo to create a dedicated CRON container that runs the same script

## Docker Compose
Use this as a starting point:
```yaml
version: '2'
services:
  renovate:
    image: stevefan1999/renovate
    environment:
      RENOVATE_CONFIG: |
        {
          "platform": "github",
          "token": "<your personal access token>",
          "onboarding": true,
          "onboardingConfig": {
            "extends": ["config:base"]
          },
          "repositories": ["<your repositories>"]
        }
```
Or if you have an existing config:
```yaml
version: '2'
services:
  renovate:
    image: stevefan1999/renovate
    volumes:
      - ./renovate.json:/tmp/renovate.json
```
Full list of configuation keys are available [here](https://renovatebot.com/docs/self-hosted-configuration/)

_(It is trivial to translate the Docker Compose config into equivalent Docker commands so it is left as an exercise for the reader)_