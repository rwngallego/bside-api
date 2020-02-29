# Docker images

## References

[https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html)

### Base image

```
# build and tag the base image
docker build -t 640306060358.dkr.ecr.eu-north-1.amazonaws.com/bside-repository:bside .

# login to ECR
aws ecr get-login-password | docker login --username AWS --password-stdin 640306060358.dkr.ecr.eu-north-1.amazonaws.com/bside-repository

# push the image
docker push 640306060358.dkr.ecr.eu-north-1.amazonaws.com/bside-repository:bside
```

### Production image

```
# build and tag the bside-prod image
docker build -f Dockerfile.prod -t 640306060358.dkr.ecr.eu-north-1.amazonaws.com/bside-repository:bside-prod .

# login to ECR
aws ecr get-login-password | docker login --username AWS --password-stdin 640306060358.dkr.ecr.eu-north-1.amazonaws.com/bside-repository

# push the image
docker push 640306060358.dkr.ecr.eu-north-1.amazonaws.com/bside-repository:bside-prod
```