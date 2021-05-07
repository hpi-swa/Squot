tests
testPrintingEmptyReport
	| report |
	report := GitReceivePackStatusReport new.
	self shouldnt: [report asString] raise: Error.