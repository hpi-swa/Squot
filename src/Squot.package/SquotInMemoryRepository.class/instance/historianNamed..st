Pur repository
historianNamed: aString
	^ historians at: aString ifAbsentPut: [self newHistorian: aString version: nil]