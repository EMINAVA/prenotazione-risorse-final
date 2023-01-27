FROM maven:3.8.7-amazoncorretto-11 AS build

RUN mkdir -p /usr/src/module
WORKDIR /usr/src/module

COPY prenotazione-risorse-security-module /usr/src/module
RUN mvn clean install

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY prenotazione_risorse /usr/src/app
RUN mvn clean package -DskipTests

FROM amazoncorretto:11-alpine-jdk

EXPOSE 8080

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY --from=build /usr/src/app/target/prenotazione-risorse.jar /usr/src/app

CMD ["java", "-jar", "prenotazione-risorse.jar"]