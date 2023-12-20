FROM docker.io/openjdk:21-slim as builder
COPY build/libs/*.jar app.jar
RUN java -Djarmode=layertools -jar app.jar extract

FROM docker.io/openjdk:21-slim
COPY --from=builder spring-boot-loader/ ./
COPY --from=builder dependencies/ ./
COPY --from=builder application/ ./
ENV JAVA_OPTS=--enable-preview
ENTRYPOINT java $JAVA_OPTS org.springframework.boot.loader.launch.JarLauncher
