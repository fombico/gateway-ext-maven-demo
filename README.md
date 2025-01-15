# Gateway Maven Demo

A sample gradle project using Spring Cloud Gateway extensions.

## Requirements

A `~/.m2/settings.xml` with
```xml
<settings>
	...
	<profiles>
		<profile>
			<id>broadcom-artifactory</id>
			<properties>
				<broadcom.artifactory.url>replace-with-url</broadcom.artifactory.url>
			</properties>
		</profile>
	</profiles>
	<activeProfiles>
		<activeProfile>broadcom-artifactory</activeProfile>
	</activeProfiles>
	<servers>
		<server>
			<id>usw1</id>
			<username>replace-with-username</username>
			<password>replace-with-password</password>
		</server>
	</servers>
</settings>
```

Alternatively, you can replace `${broadcom.artifactory.url}` in pom.xml to avoid the extra profile configuration in settings.xml.

A `~/.gradle/gradle.properties` file must be populated with:
```
broadcomJFrogArtifactoryHost=<host>
broadcomJFrogArtifactoryPassword=<password>
```

The properties file is used to download the Tanzu Auth server.
Alternatively, you can directly set these credentials in the `scripts/tanzu-auth-server.sh`.

## Running

The app requires the Tanzu Local Authorization Server. You can run this using `scripts/tanzu-auth-server.sh`.

When running the Demo Application, accessing
http://localhost:8080/test/get will redirect you to SSO.

You can log in with user/password: `test` / `test`.
