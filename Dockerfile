FROM rocker/geospatial

LABEL maintainer "Alex - Alex.porter1@nhs.net"


# basic shiny functionality
RUN R -e "install.packages(c('shiny', 'rmarkdown'))"

# install dependencies of the euler app
# system library dependency for the euler app

# basic shiny functionality
RUN R -e "install.packages(c('spatialEco', 'geojsonio'))"

COPY Rprofile.site /usr/local/lib/R/etc/

EXPOSE 3838

