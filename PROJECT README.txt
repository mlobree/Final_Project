Modern Portfolio analysis project: Marc Lobree 0937634

Inputs: assets = list of assets
	weights = the weight in the portfolio each asset takes on
	TodayDate = the date at which the function evaluates the portfolio

Return: Expected Return on portfolio
	Risk of the portfolio


Vision: The initial goals of the project is to take a list of "risky" assets and compute the expected return
	as well as the variance or risk, of the chosen portfolio.

Expected Return: I initially took to the internet to research all of the possible ways that one could look 
	at the expected return. What i came up with was many different formulas that insited in taking the rate
	change or a period of time, taking the difference and then assuming that given that same amount of time
	a person could expect to see that return on their investment. There is nothing to say that performing a
	average rate of return over a period of time is wrong, i just think that it is not very interesting.
	
	How i combated my percieved boringness of a tradiational way of getting an assets expected value was to look
	at the probability of seeing a specific change in price, rather than a percent change.
	
	Some assumptions i had to make, was that the price of the assets over the time i took my measurements did
	not change durastically, and that the rate of change in prices are relatively normal as we take higher measurements
	basically a quick use of the central limit theorem. 

	My expected value was the "Expected Value of assets Given the state of the S&P 500". My algorithm was to take the
	average change in price given the state of the S&P, i.e. if the S&P say a decrease in price, then i would add the change
	in the asset price to a grand total of the changes that asset saw, for everytime the S&P decrease in price
	I also did the same for increases. Id i then divide by the total elements in the increase and decrease Sum, i would get
	an expected value for the change in price given the S&P was up or down.
	
	E[Price of Asset | increase or decrease in S&P]

Risk of Portfolio: In order to calculate the variance of the entire portfolio, It caem down to straight forward computation
	as opposed to expected return, where i could use creativity. First i needed to calculate all of the covariances and variances
	of the assets in the portfolio. Each covariance effects the portfolio on by its relationship to the weight the assets
	hold in the portfolio, so i had the function take in a vector for the weight of the assets, that way the function can
	perform matrix multiplication by weights*covariance matrix * weights to get the variance of the portfolio

