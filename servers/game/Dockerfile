FROM eclipse-temurin:21-jre-alpine
COPY . .

WORKDIR /game
RUN wget https://github.com/Swofty-Developments/HypixelSkyBlock/releases/download/latest/SkyBlockCore.jar

ARG SERVER_TYPE
ENV SERVER_TYPE=$SERVER_TYPE

CMD java --enable-preview -jar SkyBlockCore.jar $SERVER_TYPE
