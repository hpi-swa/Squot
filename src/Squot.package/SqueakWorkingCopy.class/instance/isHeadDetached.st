refs
isHeadDetached
	^ (self headRef ifNil: [^ false]) isSymbolic not