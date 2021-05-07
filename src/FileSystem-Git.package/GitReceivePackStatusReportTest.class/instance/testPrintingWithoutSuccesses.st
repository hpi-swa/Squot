tests
testPrintingWithoutSuccesses
	| report |
	report := GitReceivePackStatusReport new.
	report error: 'Test' forReference: 'refs/heads/master'.
	self shouldnt: [report asString] raise: Error.