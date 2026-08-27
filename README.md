# hello-world-tas-app — legacy-boot-1.5.9

Spring Boot **1.5.9.RELEASE** — the original, untouched starting point of this app (Spring Boot 1.5 went GA in 2017).

Part of a multi-branch demo showing how different Spring Boot versions and CF deployment lifecycles show up in Tanzu Hub. See `main` for the full branch map.

## The point of this branch

This is what "we never got around to upgrading" looks like in Tanzu Hub: 0 years remaining on both OSS and enterprise support, "High" upgrade effort, and real CVEs on the actual libraries in use — not a hypothetical, this is a genuinely ancient release. Compare against `boot-2.7.18-oss` and `boot-2.7.35-enterprise` for what upgrading looks like at different stages.

Note: this branch uses the **legacy actuator path** (`/health`, not `/actuator/health`) and JUnit 4 — both correct for Spring Boot 1.x, and both intentionally left as-is to keep this branch a faithful snapshot.

## Building this branch

```
mvn clean package
```

## Deploying

```
cf push hello-world-tas-app -f manifest.yml --random-route
```
