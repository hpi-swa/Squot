accessing-references
resolveLooseRef: refPath
	| target |
	self privateDeprecatedUseUnitOfWork.
	refPath exists ifFalse: [ ^ nil ].
	target := refPath readStreamDo: [ :stream | stream contents asString ].
	(target beginsWith: 'ref:') 
		ifTrue: [^ self resolveRef: (target allButFirst: 4) withBlanksTrimmed].
	^ target substrings first "Ignore other junk after the hash."