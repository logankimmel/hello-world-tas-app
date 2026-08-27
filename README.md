# hello-world-tas-app — boot-4.1.1-oss

Spring Boot **4.1.1** — the latest public OSS release as of this writing (4.2.0-M1 exists but is a pre-release milestone, not GA). No Broadcom entitlement needed to build this branch.

Part of a multi-branch demo showing how different Spring Boot versions and CF deployment lifecycles show up in Tanzu Hub. See `main` for the full branch map.

## What's different from the 2.7.x branches

Spring Boot 4 (Spring Framework 7) requires **Java 17+** (this app targets 17) and heavily modularized what used to be monolithic starters. Notably, `AutoConfigureMockMvc` moved out of `spring-boot-test-autoconfigure` into a new dedicated module, `spring-boot-webmvc-test` (package `org.springframework.boot.webmvc.test.autoconfigure`) — that's an extra test-scope dependency this branch has that the 2.7.x branches don't need.

## The point of this branch

This is "as current as it gets" on the public OSS side — useful as the upper reference point against the other branches' support-status stories in Tanzu Hub.

## Building this branch

```
mvn clean package
```

No special repository configuration needed — everything resolves from Maven Central.

## Deploying

```
cf push hello-world-tas-app-4-1-oss -f manifest.yml --random-route
```
