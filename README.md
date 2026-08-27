# hello-world-tas-app — boot-2.7.18-oss

Spring Boot **2.7.18** — the last version published to public Maven Central before Spring Boot 2.7's open-source support window closed (Nov 2023). No Broadcom entitlement needed to build this branch.

Part of a multi-branch demo showing how different Spring Boot versions and CF deployment lifecycles show up in Tanzu Hub. See `main` for the full branch map.

## The point of this branch

This looks like a reasonably current version at a glance, but it's actually 0 years remaining on enterprise support — every patch since 2.7.18 (2.7.19 onward) shipped only to Broadcom's commercial Spring Enterprise repository, not to public Maven Central. In Tanzu Hub, this shows up as "Out Of Enterprise Support" despite the app looking healthy.

Compare against `boot-2.7.35-enterprise`, which is the same minor version line pulled from the entitled repo instead.

## Building this branch

```
mvn clean package
```

No special repository configuration needed — everything resolves from Maven Central.

## Deploying

```
cf push hello-world-tas-app -f manifest.yml --random-route
```
