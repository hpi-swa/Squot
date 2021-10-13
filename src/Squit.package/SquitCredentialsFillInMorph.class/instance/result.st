as yet unclassified
result

	^ Dictionary new
		at: #username put: self username asString;
		at: #password put: self password asString;
		at: #displayName put: self displayName asString;
		at: #email put: self email asString;
		yourself
		