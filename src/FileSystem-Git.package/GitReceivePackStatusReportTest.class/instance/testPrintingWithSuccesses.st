tests
testPrintingWithSuccesses
	| report |
	report := GitReceivePackStatusReport new.
	report error: 'Test' forReference: 'refs/heads/master';
		successForReference: 'refs/heads/success'.
	self shouldnt: [report asString] raise: Error;
		assert: (report asString includesSubstring: 'refs/heads/success').