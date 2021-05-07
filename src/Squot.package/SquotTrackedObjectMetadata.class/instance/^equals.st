comparing
= anObject
	| relevantKeys |
	(anObject respondsTo: #keys) ifFalse: [^ false].
	relevantKeys := self keys copyWithout: #objectsReplacedByNames.
	^ relevantKeys size = (anObject keys count: [:each | each ~= #objectsReplacedByNames])
		and: [relevantKeys allSatisfy: [:each | (anObject at: each) = (self at: each)]]