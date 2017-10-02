private metadata access
tableOfContentsReferenceIn: aFSReference 
	^ aFSReference / ({self class tocFileName. '_squot-table-of-contents'. '.squot-table-of-contents'}
		detect: [:each | (aFSReference / each) exists]
		ifNone: [self class tocFileName])