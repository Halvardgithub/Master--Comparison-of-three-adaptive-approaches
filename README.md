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

### WinBUGS and the adaptive multivariate model.Rmd
This is where the WinBUGS models are defined, specifically RW-ICAR and EW-ICAR. Additionally, the plots for the training part of the results, i.e. the precision plots, edge plots, scatterplots, correlation tables and p-value tables were also produced in this file. To save any of the figures simply uncomment the lines with ggsave and change the location. Note that the training is rather slow, so the training chucnks are not evaluated when the file is ran. Changing the eval to True at the top of those chunks increases the runtimes to around 7 hours for each multivariate model, so 14 in total. 

### CV on real data.Rmd
This is where the "cross validation" takes place. As there are three different priors for the precision these can be chosen in lines X-Y and then run the whole file. This could take some time, for me it takes just under two hours. Then all the different types of boxplot are generated. Must be saved by uncommenting lines at the bottom.

### ExpectedCases.R
Short script written by Miguel (professor in Valencia) to calculate the expected number of cases.

## Data
All the data was retrived from Instituto Nacional de Estadística (INE). The data which contains the response variabel is in the file "Mortality.csv", which is the disease counts per disease per province. The additional data needed to calculate the expected number of cases is the population data per province per age group in the file "PopXProvincesXAge.csv" and the national disease counts for each age group is in "MortalityXAge". These are then used to create "ExpectedCasesMiguel.rds" and "ObservedCases.rds", which are then the $\mathbf{E}$ and $\mathbf{y}$ used in the model formulations.

## Versions for main libraries used in R
* INLA: 24.05.01-1
* R2WinBUGS: 2.1.22.1
* pbugs: 1.0.6
For the remainder of the libraries the versions should not be of consequence, and if future updates are not backwards compatible it should be easy to alter the code.


