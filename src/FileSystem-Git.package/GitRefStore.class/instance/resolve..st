accessing
resolve: aString
	| target |
	target := self targetOf: aString.
	target ifNil: [^ nil "does not exist"].
	(target beginsWith: 'ref:') 
		ifTrue: [^ self currentUnitOfWork resolveRef: (target allButFirst: 4) withBlanksTrimmed].
	^ target substrings first "Ignore other junk after the hash."