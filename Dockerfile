FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from=build /app/targetUber.jar /app/
EXPOSE 9888
CMD ["java","jar","Uber.jar"]