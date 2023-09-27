FROM rocker/shiny-verse

LABEL maintainer "Alex Porter <alex.porter1@nhs.net>"

ARG project=testApp

# install Debian dependencies for R
#RUN apt-get update && apt-get install -y \
#    sudo \
#    pandoc \
#    pandoc-citeproc \
#    libcurl4-gnutls-dev \
#    libcairo2-dev \
#    libxt-dev \
#    libssl-dev \
#    libssh2-1-dev \
#    libxml2-dev \
#    libgit2-dev 

# system libraries
# Try to only install system libraries you actually need
# Package Manager is a good resource to help discover system deps
RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev

# packages needed renv and install
RUN R -e "install.packages(c('renv', 'devtools'), repos='https://cloud.r-project.org'); renv::consent(provided = TRUE)"
RUN R -e "install.packages('plotly', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('readxl', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('shinydashboard', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('shinythemes', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('flexdashboard', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('scales', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('DT', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('reactable', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('reactablefmtr', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('gridExtra', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('cowplot', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('tippy', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('shinythemes', repos='http://cran.rstudio.com')"
RUN R -e "install.packages('shinyalert', repos='http://cran.rstudio.com')"



# copy the app directory into the image
#COPY app/* /srv/shiny-server/app1/
#COPY app/www /srv/shiny-server/app1/www



# create root folder for app in container
#RUN mkdir /root/${project}

# copy the app to the image
#COPY app /root/${project}

COPY shiny-server.conf /etc/shiny-server/shiny-server.conf

#USER shiny

#COPY app/Rprofile.site /usr/lib/R/etc/
EXPOSE 3838

#CMD ["R", "-e", "shiny::runApp('/root/testApp')"]

# run app
CMD ["/usr/bin/shiny-server"]

