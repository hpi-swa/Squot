testing
expectedFailures
	"All tests are failing because we did not find any dumb repository to test against. Only #testNegotiation currently passes. "
	^ self class allTestSelectors copyWithoutAll: #(testNegotiation)