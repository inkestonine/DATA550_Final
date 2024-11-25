FROM rocker/r-ver:4.4.1

RUN apt-get update && apt-get install -y \
    pandoc \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libprotobuf-dev \
    libgeos-dev \
    libudunits2-dev \
    libgdal-dev \
    libproj-dev && apt-get clean

RUN mkdir /project
WORKDIR /project 

RUN mkdir code
RUN mkdir output
COPY code code
COPY Analytic_Data_Set_Creationsdoh_2009.csv .
COPY Makefile .
COPY report.Rmd .


COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt = FALSE)"


RUN mkdir report

#CMD make && mv report.html report
CMD ["make", "&&", "mv", "report.html", "report"]

