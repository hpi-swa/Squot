accessing
resolve: aString
	| target |
	self deprecated: 'The GitUnitOfWork should do the resolving by itself.'.
	target := self targetOf: aString.
	target ifNil: [^ nil "does not exist"].
	(target beginsWith: 'ref:') 
		ifTrue: [^ self currentUnitOfWork resolveRef: (target allButFirst: 4) withBlanksTrimmed].
	^ target substrings first "Ignore other junk after the hash."