
## introduction to categorical data analysis, AGRESTI, 2nd edition, 2007
## chapter 1, page 10

# Method 1: Inverting the Wald Test (AKA Normal Approximation)
	phat = 0.9;
	n = 10;
	ci = phat + c(-1, 1) * qnorm(p = 0.975) * sqrt((phat * (1 - phat))/n);


	## should use binconf function in the Hmisc library
	install.packages('Hmisc');
	library(Hmisc, T);
	binconf(x=9, n=10, method="asymptotic");


# Method 2: The score confidence interval contains the p0 values for which | z statistic | < z(0.025)
#	     Agresti gives the analytical expressions for these endpoints on his p. 10 and exercise 1.18 (p. 20)

	# Built-in functions that compute the score confidence interval include the prop.test function
	res = prop.test(x=9,n=10,conf.level=0.95,correct=F);
	res$conf.int

	# and the binconf function from Hmisc via its method=?wilson? option
	binconf(x=9, n=10, alpha=.05, method="wilson");





