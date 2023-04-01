library(RiskPortfolios)

# A matrix containing daily returns
# of 10 industry portfolios for the year 2014.
data("Industry_10")
rets <- Industry_10

# Mean
mu <- meanEstimation(rets)
# Covariance estimation
Sigma <- covEstimation(rets)
# Semi-deviation estimation
semiDev <- semidevEstimation(rets)

#optimal portfolio's weights
optimalPortfolio(mu = mu, Sigma = Sigma)

# Mean-variance portfolio with the long-only constraint and gamma = 0.89
optimalPortfolio(mu = mu, Sigma = Sigma,
                 control = list(type = 'mv', constraint = 'lo'))
# Minimim volatility portfolio with LB and UB constraints
optimalPortfolio(Sigma = Sigma,
  control = list(type = 'minvol', constraint = 'user',
                 LB = rep(0.02, 10), UB = rep(0.8, 10)))

# Minimum volatility portfolio with the gross constraint
# and the gross constraint parameter = 1.6
optimalPortfolio(Sigma = Sigma, control = list(type = 'minvol', constraint = 'gross'))
# Minimum volatility portfolio with the gross constraint
# and the gross parameter = 1.2
optimalPortfolio(Sigma = Sigma,control = list(type = 'minvol',
                             constraint = 'gross', gross.c = 1.2))