as yet unclassified
expectedFailures
	"Most tests are failing because we did not implement the SmartHTTPProtocol yet. "
	^ self class allTestSelectors copyWithoutAll: #(testNegotiation testClassComment testCoverage testNew testUnCategorizedMethods testWant testCorrectProtocol)