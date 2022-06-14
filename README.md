# Jython Docker
Docker images for the latest [Jython](https://www.jython.org/).

## Building

### Using official Jython 2.7.2 installer from [Maven](https://search.maven.org/artifact/org.python/jython-installer)

```
docker build -t jython:2.7.2-alpine -f Dockerfile .
```

### Using the latest code from the master branch

This branch contains some fixes that are not yet released.

```
DOCKER_BUILDKIT=1 docker build -t jython:2.7.3-alpine -f master.Dockerfile .
```
