report.html: report.Rmd code/render_report.R output/region_table.rds \
 output/map.png
	Rscript code/render_report.R

output/region_table.rds output/cleaned_2009.rds&: \
 code/table.R Analytic_Data_Set_Creationsdoh_2009.csv
	Rscript code/table.R
	
output/map.png: code/map.R output/cleaned_2009.rds
	Rscript code/map.R

.PHONY: clean
clean:
	rm -f output/*.png && rm -f output/*rds && rm -f .Rhistory