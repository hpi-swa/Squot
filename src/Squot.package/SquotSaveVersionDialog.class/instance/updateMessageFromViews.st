ui
updateMessageFromViews
	self dependents
		select: [:each | (each respondsTo: #getTextSelector)
				and: [each getTextSelector == #message]]
		thenDo: [:each | each accept].