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

RUN R -e "shiny::runApp('/srv/shiny-server')"

CMD ["R", "-e", "shiny::runApp('/srv/shiny-server', port = 3838, host = '0.0.0.0')"]


# select port
EXPOSE 3838

