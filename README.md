# hello-world-tas-app — docker-container-image

Same entitled Spring Boot 2.7.35 code as `boot-2.7.35-enterprise`, but built as a **container image** and pushed to Cloud Foundry via the docker lifecycle instead of a buildpack.

Part of a multi-branch demo showing how different Spring Boot versions and CF deployment lifecycles show up in Tanzu Hub. See `main` for the full branch map.

## The point of this branch

This app is fully patched and in support — but Tanzu Hub's Vulnerability Insights **will not show it**. Hub's per-app vulnerability linkage is built on the app-to-buildpack relationship that only exists for CF's buildpack lifecycle. A docker-lifecycle app is just an opaque OCI image to Cloud Foundry, so there's no relationship for Hub to key off of, regardless of how well-maintained the image actually is.

## Building and pushing the image

Requires the same Broadcom Spring Enterprise credentials as `boot-2.7.35-enterprise` (see that branch's README), available during the Docker build via a BuildKit secret:

```
docker buildx build --secret id=mvn_settings,src="$HOME/.m2/settings.xml" \
  --platform linux/amd64 \
  -t <your-registry>/hello-world-tas-app:latest \
  --push .
```

`--platform linux/amd64` matters — CF cells run amd64, so build for that even from an Apple Silicon Mac.

## Deploying

```
cf push hello-world-tas-app-docker --no-manifest \
  -o <your-registry>/hello-world-tas-app:latest \
  --random-route -m 1G -i 1 -u http --endpoint /actuator/health
```

Note `--no-manifest` — `manifest.yml` in this repo specifies buildpacks, which conflicts with `--docker-image`.

The container runs as a non-root user (required by CF) — see the `Dockerfile`.
