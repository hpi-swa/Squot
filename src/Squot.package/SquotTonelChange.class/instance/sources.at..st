merging
sources: aCollectionOrNil at: aNumber
	^ aCollectionOrNil ifNil: [''] ifNotNil: [aCollectionOrNil at: aNumber]