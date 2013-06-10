︠59047216-a06c-4bff-91ca-8e4627742220︠
import numpy

def portfolio(*args):

    # A quick check to make sure all weight of the portfolio is accounted for
    if sum(weights) != 1:
        "Your portfolio weights don't equal 1"

    # assigning stocks to variable assets in order to not have to call to the website many times
    asset1 = finance.Stock(assets[0]).close(startdate='Mar+2, +2013', enddate= TodayDate)
    asset2 = finance.Stock(assets[1]).close(startdate='Mar+2, +2013', enddate= TodayDate)
    asset3 = finance.Stock(assets[2]).close(startdate='Mar+2, +2013', enddate= TodayDate)
    SPY = finance.Stock('SPY').close(startdate='Mar+2, +2013', enddate= TodayDate)

    d = len(asset1)
    c = len(SPY)


    # To get the type of expected return the function needs to find the difference in the assets from day to day
    # a stock price down not come in at a normal distribution, but the differences in the day to day does
    # by assumptions of the central limit theorem i will be able to get an expected value from the differences
    diffs1 = asset1.diffs()
    diffs2 = asset2.diffs()
    diffs3 = asset3.diffs()
    diffsSPY= SPY.diffs()

    # assigning variable to get a list of possible changes in the stock price
    priceUp1 = 0
    priceUp2 = 0
    priceUp3 = 0
    priceDown1 = 0
    priceDown2 = 0
    priceDown3 = 0
    countUp = 0
    countDown = 0

    # This for loop goes first through the S&P price list and check for whether the change in price was positive or negative
    # if the change was negative the differnce in the price of the assets was then recorded and put into a total sum
    for i in range(d-1):
        index = diffsSPY[i]
        if index > 0:
            priceUp1 = priceUp1 + diffs1[i]
            priceUp2 = priceUp2 + diffs2[i]
            priceUP3 = priceUp3 + diffs3[i]
            countUp = countUp + 1
        else:
            priceDown1 = priceDown1 + diffs1[i]
            priceDown2 = priceDown2 + diffs2[i]
            priceDown3 = priceDown3 + diffs3[i]
            countDown = countDown + 1

    # by CLT we can divide by the number of elements that make of the sum for each of the prices up or prices down
    # to get an expected price for when the price goes up or the price goes down
    deltaUp1 = priceUp1/countUp
    deltaDown1 = priceDown1/countDown
    deltaUp2 = priceUp2/countUp
    deltaDown2 = priceDown2/countDown
    deltaUp3 = priceUp3/countUp
    deltaDown3 = priceDown3/countDown

    ER1 = 0
    ER2 = 0
    ER3 = 0

    # depending on the lag state of the S&P, the Expected value for the next state in the assets are chosen
    if diffsSPY[d-2] > 0:
        ER1 = asset1[d-1] + deltaUp1
        ER2 = asset2[d-1] + deltaUp2
        ER3 = asset3[d-1] + deltaUp3
    else:
        ER1 = asset1[d-1] + deltaDown1
        ER2 = asset2[d-1] + deltaDown2
        ER3 = asset3[d-1] + deltaDown3

    ERport = numpy.array([ER1,ER2,ER3])

    # setting a list for all of the covariances
    cov11 = asset1.covariance(asset1)
    cov12 = asset1.covariance(asset2)
    cov13 = asset1.covariance(asset3)
    cov21 = asset2.covariance(asset1)
    cov22 = asset2.covariance(asset2)
    cov23 = asset2.covariance(asset3)
    cov31 = asset3.covariance(asset1)
    cov32 = asset3.covariance(asset2)
    cov33 = asset3.covariance(asset3)

    CovMat = matrix([[cov11,cov12,cov13],[cov21,cov22,cov23],[cov31,cov32,cov33]])

    # Doing appropriate matrix multiplication to get the expected return and risk of the portfolio
    ExpectedReturn = ERport*weights

    ExpectedRisk = weights*CovMat*weights
    ExpectedRisk = numpy.sqrt(ExpectedRisk)

    ExpectedReturn
    ExpectedRisk

    TotalReturn = (ER1 - asset1[d-1]) + (ER2 - asset2[d-1]) + (ER3 - asset3[d-1])

    return (ExpectedReturn, ExpectedRisk, TotalReturn)

assets = ['msft', 'goog', 'aapl']
weights = numpy.array([.3,.4,.3])
TodayDate = 'Jun+2,+2013'

portfolio(assets, weights,TodayDate)
︡ed0fae5b-338a-40a7-8f66-9a88f9676c1b︡{"stdout":"(array([  10.447125  ,  345.95666667,  134.445625  ]), array([[  0.78709072,   3.57011328,   0.96790148],\n       [  2.67758496,  15.5509853 ,   5.07874419],\n       [  0.96790148,   6.77165892,   5.18637144]]), -7.9925000000000495)"}︡
︠a577c1ef-dd3b-4cff-bb0c-e3c35c3a5191︠

