# hello-world-tas-app — docker-container-image

Spring Boot **2.7.18** (public OSS, same as `boot-2.7.18-oss`), but built as a **container image** and pushed to Cloud Foundry via the docker lifecycle instead of a buildpack. No Broadcom entitlement needed to build this branch — everything resolves from Maven Central.

Part of a multi-branch demo showing how different Spring Boot versions and CF deployment lifecycles show up in Tanzu Hub. See `main` for the full branch map.

## The point of this branch

Regardless of what's actually running inside it, Tanzu Hub's Vulnerability Insights **will not show this app at all**. Hub's per-app vulnerability linkage is built on the app-to-buildpack relationship that only exists for CF's buildpack lifecycle. A docker-lifecycle app is just an opaque OCI image to Cloud Foundry, so there's no relationship for Hub to key off of — this is a visibility gap that exists independent of the Spring Boot version or patch status of the code inside the image.

## Building and pushing the image

```
docker buildx build --platform linux/amd64 \
  -t <your-registry>/hello-world-tas-app:latest \
  --push .
```

`--platform linux/amd64` matters — CF cells run amd64, so build for that even from an Apple Silicon Mac. No Maven or JDK needed on your machine — the multi-stage `Dockerfile` builds the jar inside the container.

## Deploying

```
cf push hello-world-tas-app-docker --no-manifest \
  -o <your-registry>/hello-world-tas-app:latest \
  --random-route -m 1G -i 1 -u http --endpoint /actuator/health
```

Note `--no-manifest` — `manifest.yml` in this repo specifies buildpacks, which conflicts with `--docker-image`.

The container runs as a non-root user (required by CF) — see the `Dockerfile`.
