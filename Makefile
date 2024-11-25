# report-associated rules (run within docker container)
report.html: report.Rmd code/render_report.R output/region_table.rds \
 output/map.png
	Rscript code/render_report.R

output/region_table.rds output/cleaned_2009.rds&: \
 code/table.R Analytic_Data_Set_Creationsdoh_2009.csv
	Rscript code/table.R
	
output/map.png: code/map.R output/cleaned_2009.rds
	Rscript code/map.R
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: clean
clean:
	rm -f output/*.png && rm -f output/*rds && rm -f .Rhistory && rm -f report.html
	
# docker-associated rules (run on our local machine)
PROJECTFILES = report.Rmd code/table.R code/map.R code/render_report.R
RENVFILES = renv.lock renv/activate.R renv/settings.json

# rule to build image
final: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t final .
	touch $@

# rule to build the report automatically in our container
report/report.html: report
	docker run -v "/$(pwd)/report":/project/report final

