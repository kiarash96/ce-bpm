FROM node:alpine as frontend
WORKDIR /app
COPY ./frontend .
RUN npm install
RUN npm run build -- --base=/forms/


FROM gradle:jdk11-alpine as backend
WORKDIR /app
COPY ./backend .
COPY --from=frontend /app/dist ./src/main/resources/static/forms
RUN gradle bootJar


FROM openjdk:11 as webapp
WORKDIR /app
COPY --from=backend /app/build/libs/app.jar .
CMD ["java", "-jar", "app.jar", "--spring.profiles.active=prod"]

