FROM openjdk:17-slim

EXPOSE 8082
COPY build/libs/ /jre
WORKDIR /jre

RUN addgroup appuser && adduser --disabled-password --gecos '' appuser --ingroup appuser
USER appuser

CMD ["java", "-XX:MaxRAMPercentage=50", "-Xshare:off", "-jar", "test.jar"]
