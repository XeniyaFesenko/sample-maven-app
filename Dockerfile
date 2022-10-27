FROM openjdk:8

#Define environment variables
ENV MULE_HOME=/opt/mule

#Download mule runtime
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y zip wget \
    && cd /opt \
    && wget -q -O mule-4.3.0.zip https://s3.amazonaws.com/new-mule-artifacts/mule-ee-distribution-standalone-4.3.0-20210119.zip \
    && unzip mule-4.3.0.zip \
    && mv mule-enterprise-standalone-4.3.0-20210119 mule \
    && apt-get clean



# EXPOSED Application Port
EXPOSE 80

# Copy application files
COPY ./target/*.jar ${MULE_HOME}/apps
CMD ["/opt/mule/bin/mule"]
