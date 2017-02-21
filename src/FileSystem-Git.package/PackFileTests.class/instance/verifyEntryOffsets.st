helpers-verifying
verifyEntryOffsets
	[ self verifyOffsetsWithOfsDelta ]
		on: TestFailure
		do: [ self verifyOffsetsWithRefDelta ]