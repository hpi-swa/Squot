paths
commonPathPrefix
	| parents |
	parents := self paths collect: #parent.
	^ parents size caseOf: {
		[0] -> [FSPath root].
		[1] -> [parents first].
	} otherwise: [parents reduce: [:a :b | self commonPathOf: a and: b]]