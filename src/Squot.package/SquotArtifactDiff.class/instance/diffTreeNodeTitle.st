*Squot-Tools
diffTreeNodeTitle
	^ (self path isEmpty
		ifTrue: [self diffNodeFallbackTitle]
		ifFalse: [self path])