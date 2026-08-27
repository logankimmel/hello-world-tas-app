# hello-world-tas-app

Simple Spring Boot "Hello World" app for Tanzu Platform / Cloud Foundry — used as a demo of how different Spring Boot versions and CF deployment lifecycles show up in Tanzu Hub's Vulnerability Insights.

`main` tracks the recommended state: Spring Boot 2.7.35 from Broadcom's Spring Enterprise repo, buildpack lifecycle.

## Branches

| Branch | Spring Boot | Lifecycle | What it demonstrates |
|---|---|---|---|
| `legacy-boot-1.5.9` | 1.5.9.RELEASE | buildpack | Ancient release: 0 OSS/enterprise support remaining, high upgrade effort, real CVEs |
| `boot-2.7.18-oss` | 2.7.18 (public) | buildpack | Last public OSS release: out of enterprise support despite looking "recent" |
| `boot-2.7.35-enterprise` (= `main`) | 2.7.35 (entitled) | buildpack | Current entitled patch from Broadcom's Spring Enterprise repo: fully in support |
| `docker-container-image` | 2.7.18 (public) | docker (`cf push --docker-image`) | Invisible to Tanzu Hub's Vulnerability Insights regardless of patch status — no buildpack relationship for Hub to key off of |
| `boot-4.1.1-oss` | 4.1.1 (public, latest) | buildpack | Latest public OSS release, Java 17+ baseline, heavily modularized test starters |

## Deployed apps (Cloud Foundry: `tanzu-hub.kuhn-labs.com`)

- `hello-world-tas-app` — `boot-2.7.18-oss`
- `hello-world-tas-app-2-7-enterprise` — `boot-2.7.35-enterprise`
- `hello-world-tas-app-docker` — `docker-container-image`
- `hello-world-tas-app-4-1-oss` — `boot-4.1.1-oss`

See [`docs/architecture.png`](docs/architecture.png) for the full build → deploy → Hub-visibility picture across all three.

## Building the enterprise branch

Only `boot-2.7.35-enterprise` pulls from Broadcom's commercial Spring Enterprise Maven repository, which requires your own entitled Broadcom Support Portal registry token — see that branch's README for setup. Every other branch (`legacy-boot-1.5.9`, `boot-2.7.18-oss`, `docker-container-image`, `boot-4.1.1-oss`) builds from public Maven Central only, no entitlement needed.
