pivate
parseRefs: aResponse
	refs := Dictionary new.
	aResponse contents asString linesDo: [ :line| |split|
		split := line splitOn: String tab.
		refs at: split second put: split first ].
	^ refs