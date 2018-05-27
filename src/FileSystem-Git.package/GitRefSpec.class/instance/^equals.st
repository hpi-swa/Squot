comparing
= anObject
	anObject species == self species ifFalse: [^ false].
	^ anObject areDestructiveUpdatesAllowed == self areDestructiveUpdatesAllowed
		and: [anObject leftRefPattern = self leftRefPattern]
		and: [anObject rightRefPattern = self rightRefPattern]