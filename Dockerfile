FROM rocker/geospatial

LABEL maintainer "Alex - Alex.porter1@nhs.net"


# basic shiny functionality
RUN R -e "install.packages(c('shiny', 'rmarkdown'))"

# install dependencies of the euler app
# system library dependency for the euler app

# basic shiny functionality
RUN R -e "install.packages(c('spatialEco', 'geojsonio'))"

#COPY Rprofile.site /usr/local/lib/R/etc/

# copy the app to the image
COPY *.Rproj /srv/shiny-server/
COPY *.R /srv/shiny-server/
COPY *.xlsx /srv/shiny-server/

# select port
EXPOSE 3838

# allow permission
RUN sudo chown -R shiny:shiny /srv/shiny-server

# Copy further configuration files into the Docker image
COPY shiny-server.sh /usr/bin/shiny-server.sh

RUN ["chmod", "+x", "/usr/bin/shiny-server.sh"]

# run app
CMD ["/usr/bin/shiny-server.sh"]

