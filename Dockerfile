FROM openanalytics/r-base

LABEL maintainer "Alex Porter <alex.porter1@nhs.net>"

ARG project=testApp

# install Debian dependencies for R
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libxml2-dev \
    libgit2-dev 

# packages needed renv and install
RUN R -e "install.packages(c('renv', 'devtools'), repos='https://cloud.r-project.org'); renv::consent(provided = TRUE)"
RUN R -e "install.packages('shiny', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('shinydashboard', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('shinythemes', repos='http://cran.rstudio.com')"

# create root folder for app in container
RUN mkdir /root/${project}

# copy the app to the image
COPY app /root/${project}

#COPY inst/shiny-server.conf /etc/shiny-server/shiny-server.conf

COPY Rprofile.site /usr/lib/R/etc/
EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/root/testApp')"]
