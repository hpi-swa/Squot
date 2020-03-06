actions on objects
actionObjectUntrack
	| workingCopy selected |
	(workingCopy := self projectSelection) ifNil: [^ self].
	(selected := self objectSelection) ifNil: [^ self].
	self withUnitOfWork:
	[(workingCopy includesObjectAt: selected artifact path) ifTrue:
		[workingCopy removeAt: selected artifact path]].