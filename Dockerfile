FROM openjdk:8u212-jdk-alpine3.9

ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java", "-Dspring.profiles.active=prod","-Xms128m","-Xmx256m","-cp","app:app/lib/*",\
  "de.thkoeln.archilab.fae.GPSMockService.GpsMockServiceApplication"]
