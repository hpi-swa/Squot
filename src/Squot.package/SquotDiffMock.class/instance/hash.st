comparing
hash
	^ (self copiedFrom ifNil: [^ super hash]) hash