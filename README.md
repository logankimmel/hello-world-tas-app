# hello-world-tas-app — boot-2.7.35-enterprise

Spring Boot **2.7.35**, pulled from Broadcom's commercial Spring Enterprise Maven repository — the current entitled patch, fully in support.

Part of a multi-branch demo showing how different Spring Boot versions and CF deployment lifecycles show up in Tanzu Hub. See `main` for the full branch map.

## Building this branch

This branch's `pom.xml` imports `spring-boot-dependencies` from Broadcom's Spring Enterprise repo instead of Maven Central, so you need your own entitlement:

1. Generate a Registry Token from the Broadcom Support Portal (My Downloads > Registry Tokens). Requires a Tanzu Spring Enterprise entitlement.
2. Add credentials to `~/.m2/settings.xml`:

   ```xml
   <servers>
     <server>
       <id>spring-enterprise-subscription</id>
       <username>YOUR_SUPPORT_PORTAL_EMAIL</username>
       <password>YOUR_REGISTRY_TOKEN</password>
     </server>
     <server>
       <id>spring-enterprise-dependencies</id>
       <username>YOUR_SUPPORT_PORTAL_EMAIL</username>
       <password>YOUR_REGISTRY_TOKEN</password>
     </server>
   </servers>
   ```

3. `mvn clean package`

## Deploying

```
cf push hello-world-tas-app-2-7-enterprise -f manifest.yml --random-route
```

In Tanzu Hub, this app shows 0 out-of-enterprise-support libraries and no vulnerabilities requiring an upgrade.
