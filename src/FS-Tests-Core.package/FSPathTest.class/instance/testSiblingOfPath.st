tests
testSiblingOfPath
	| griffle  nurb |
	griffle := FSPath / 'griffle'.
	nurb := FSPath / 'nurb'.
	self deny: (griffle isChildOf: nurb).
	self deny: (nurb isChildOf: griffle).