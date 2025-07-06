# Master--Comparison-of-three-adaptive-approaches
The codebase for my Master in Applied physics and mathematics concerning spatial Bayesian hierarchical models in the field of epidemiology. The application study uses data from Spain at the level of Autonomous regions and Provinces.

## Different results and cofigurations
Without scale and with iid Theta refers to the two WinBUGS models with an iid effect and the plots are not scaled by the disease specific precision included in the model. With scaling and iid theta still has the iid and now scales with the average of the diseases specific precision to make the plots more comparable for different methods and different n's. Note that the result for ABYM (or RW-ICAR) is the same, but the plots are different because of scaling. Lastly, the methods with scalign and without iid theta for comparison, and to only focus on the structured spatial effect without interference from the iid theta, even though most actual models would include this.

## The different .Rmd files
All the code is contained in the four .Rmd files, and they were used to produce all the figures and plots in the thesis. Vrious plots are produced in all four of the files, simply search up "ggsave" to see where they are saved, or "xtabel" to find where latex output has been generated before being copied over to the overleaf document.

### Temporal simulations.Rmd
This file contains the code for the temporal simulations, the linear regression example and the polynomial regression in the appenidx.. To obtain the same plots simply run the file and the plot will be produced. To save it locally uncomment the code lines with "ggsave" and chosse an appropriate location.

### Spatial Wakefield and geojson handeling.Rmd
This file handles the inital geojson file for Spain as well as defining the Border weighted model from Wakefield(2024). It also includes multiple plots, a brief sensitivity analysis of the prior for the precision in the Border Weighted ICAR. The last code chunk was used to preprocess the data and was only used to generate the desired data back in march. 

Relevant linenumbers
* Implementing the BW-ICAR: 288-371
* Sensitivity analysis for BW-ICAR: 381-420
The rest of the code is mainly plotting various maps and results, and some procesing of the data.

### WinBUGS and the adaptive multivariate model.Rmd
This is where the WinBUGS models are defined, specifically RW-ICAR and EW-ICAR. Additionally, the plots for the training part of the results, i.e. the precision plots, edge plots, scatterplots, correlation tables and p-value tables were also produced in this file. To save any of the figures simply uncomment the lines with ggsave and change the location. Note that the training is rather slow, so the training chucnks are not evaluated when the file is ran. Changing the eval to True at the top of those chunks increases the runtimes to around 7 hours for each multivariate model, so around 14 in total. 

Relevant linenumbers
* Defining and running the RW-ICAR: 62-302
* Defining and running the EW-ICAR: 400-689
* Plots and figures: 744-1490

### CV on real data.Rmd
This is where the "cross validation" takes place. As there are three different priors for the precision these can be chosen in lines X-Y and then run the whole file. This could take some time, for me it takes just under two hours. Then all the different types of boxplot are generated. Must be saved by uncommenting lines at the bottom.

Relevant linenumbers
* Creating and scaling the neighbourhood structures from the training: 146-189
* Defining the validation model with rgeneric: 191-242
* Choosing the validation prior: 246-248
* Running the validation: 300-444
* Saving the result: 447-458
* Plotting results: 521-884
For the plotting, the plots are based on the file imported at lines 530-537, which were saved on 447-458. Then the plots are saved at lines 855-884. Changing between the priors is done by commenting in and out the relevant lines.

### ExpectedCases.R
Short script written by Miguel (professor in Valencia) to calculate the expected number of cases.

## Data
All the data was retrived from Instituto Nacional de Estadística (INE). The data which contains the response variabel is in the file "Mortality.csv", which is the disease counts per disease per province. The additional data needed to calculate the expected number of cases is the population data per province per age group in the file "PopXProvincesXAge.csv" and the national disease counts for each age group is in "MortalityXAge". These are then used to create "ExpectedCasesMiguel.rds" and "ObservedCases.rds", which are then the $\mathbf{E}$ and $\mathbf{y}$ used in the model formulations.

## Simulated results
The results from my training were to large to put on GitHub, and were instead put on Zenodo, at https://zenodo.org/records/15799852. These results can be downloaded and stored locally, and then used to generate the same figures as in the thesis, most of which are stored in the folder Plots. Some of the tables were also created by xtable in R which prints the latex equivalent of a table in R, this was then copied to the overleaf report. The downloaded data is typically imported to the .rmd files by ReadRDS. 

## Versions for main libraries used in R
* INLA: 24.05.01-1
* R2WinBUGS: 2.1.22.1
* pbugs: 1.0.6
For the remainder of the libraries the versions should not be of consequence, and if future updates are not backwards compatible it should be easy to alter the code.


