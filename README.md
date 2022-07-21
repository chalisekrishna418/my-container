## Using the Dockerfile

```
docker run -it -v ~/.aws:/root/.aws -v ~/.ssh/:/root/.ssh/ my-container:latest /bin/bash
```