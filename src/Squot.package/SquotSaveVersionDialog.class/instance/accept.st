ui
accept
	canceled := false.
	self dependents
		select: [:each | (each respondsTo: #getTextSelector)
				and: [each getTextSelector == #message]]
		thenDo: [:each | each accept].
	self topView ifNotNil: #delete.