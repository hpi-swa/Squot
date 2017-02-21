helpers-verifying
verifyEntrySizes
	[ self verifySizesWithOfsDelta ]
		on: TestFailure
		do: [ self verifySizesWithRefDelta ]