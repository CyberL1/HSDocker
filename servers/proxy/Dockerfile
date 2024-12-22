FROM eclipse-temurin:21-jre-alpine
COPY . .

WORKDIR /proxy

RUN mkdir plugins
RUN wget -O plugins/SkyBlockProxy.jar https://github.com/Swofty-Developments/HypixelSkyBlock/releases/download/latest/SkyBlockProxy.jar
RUN wget -O velocity.jar https://api.papermc.io/v2/projects/velocity/versions/3.3.0-SNAPSHOT/builds/400/downloads/velocity-3.3.0-SNAPSHOT-400.jar

RUN wget https://raw.githubusercontent.com/Swofty-Developments/HypixelSkyBlock/refs/heads/master/configuration/velocity.toml
RUN echo secret > forwarding.secret

CMD java -jar velocity.jar
