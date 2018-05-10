adding
addShadow: aShadow of: anObject
	| name |
	name := self nameOf: anObject ifAbsent: [^ aShadow].
	shadows at: name put: aShadow undecorated.
	self answer: name whenAskedForTheNameOf: aShadow undecorated.
	^ aShadow