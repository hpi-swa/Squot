testing
expectedFailures
	"Most tests are failing because we did not find any dumb repository to test against. "
	^ self class allTestSelectors copyWithoutAll: #(testNegotiation testClassComment testCoverage testNew testUnCategorizedMethods testTags)