accessing
ref: aString
	accesses add: {#get. aString}.
	^ refs associationAt: aString ifAbsent: []