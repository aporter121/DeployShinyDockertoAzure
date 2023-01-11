FROM openanalytics/r-base

# install required R packages
RUN install.r servr

# install pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/2.6/pandoc-2.6-1-amd64.deb
RUN dpkg -i pandoc-2.6-1-amd64.deb

# use default port for shinyproxy apps, so you don't have to add port in application.yml
EXPOSE 3838  

CMD ["R", "-e", "servr::httd('/data/StaticContent', port = 3838, host = '0.0.0.0')"]
