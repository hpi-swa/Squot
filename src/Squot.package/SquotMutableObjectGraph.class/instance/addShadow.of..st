adding
addShadow: aShadow of: anObject
	| name |
	name := self nameOf: anObject ifAbsent: [^ aShadow].
	shadows at: name put: aShadow.
	self answer: name whenAskedForTheNameOf: aShadow.
	^ aShadow