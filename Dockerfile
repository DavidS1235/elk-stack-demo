FROM openjdk:11
EXPOSE 9898
ADD target/elk-stack-example-0.0.1-SNAPSHOT.jar elk-stack-example.jar
ENTRYPOINT ["java", "-jar", "elk-stack-example.jar"]
