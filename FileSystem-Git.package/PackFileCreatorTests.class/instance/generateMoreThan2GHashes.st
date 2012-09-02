helpers
generateMoreThan2GHashes
	| hashes offset random |
	hashes := OrderedCollection new.
	offset := 12.
	random := Random new.
	0 to: (2 raisedTo: 32) do: [ :index |
		hashes add: (GitHash from: 'some message', index asString) -> offset.
		offset := offset + (random nextInt: offset) ].
	
	creator 
		instVarNamed: 'sortedHashes' 
		put: (hashes collect: [ :assoc | assoc key ]) asSortedCollection.
	creator
		instVarNamed: 'hashDict'
		put: hashes asDictionary