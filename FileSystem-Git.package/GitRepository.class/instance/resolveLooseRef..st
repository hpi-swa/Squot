accessing-references
resolveLooseRef: refPath
	| target |
	refPath exists ifFalse: [ ^ nil ].
	target := refPath readStreamDo: [ :stream | stream contents asString ].
	(target beginsWith: 'ref:') 
		ifTrue: [^ self resolveRef: (target allButFirst: 4) trimBoth].
	^ target substrings first "Ignore other junk after the hash."