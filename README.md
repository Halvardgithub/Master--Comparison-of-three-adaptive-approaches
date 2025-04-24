# Master--Comparison-of-three-adaptive-approaches
The codebase for my Master in Applied physics and mathematics concerning spatial Bayesian hierarchical models in the field of epidemiology. The application study uses data from Spain at the level of Autonomous regions and Provinces.

## Different results and cofigurations
Without scale and with iid Theta refers to the two WinBUGS models with an iid effect and the plots are not scaled by the disease specific precision included in the model. With scaling and iid theta still has the iid and now scales with the average of the diseases specific precision to make the plots more comparable for different methods and different n's. Note that the result for ABYM (or RW-ICAR) is the same, but the plots are different because of scaling. Lastly, the methods with scalign and without iid theta for comparison, and to only focus on the structured spatial effect without interference from the iid theta, even though most actual models would include this.


## Questions and things to do

* The total prec plot with scaling and without theta looks very wrong, check that.
* Get the CV to work, maybe make some tests for the matrices, like non-zero elements in the same places and so on
* Possibly add n=70 and try with a different seed to compare the two
* Need to write more!
* Ta med ICAR og standard Wakefield i CV
* lag box plot for resultater
