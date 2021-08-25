*Squot-Tools
ifError: errorBlock ifNotError: rejectedBlock
	| reason |
	reason := self reason.
	^ (reason isKindOf: Error)
		ifTrue: [errorBlock cull: reason]
		ifFalse: [rejectedBlock cull: reason]