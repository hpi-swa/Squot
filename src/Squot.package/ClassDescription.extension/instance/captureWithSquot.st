*Squot-trackable
captureWithSquot
	self isMeta ifTrue: [^ super captureWithSquot].
	^ SquotClassShadow
		forPackageNamed: self category
		withSnapshot: (MCSnapshot fromDefinitions: (Array streamContents: [:stream |
			stream nextPutAll: self classDefinitions.
			self selectorsDo: [:each | stream nextPut: (MethodReference class: self selector: each) asMethodDefinition]]))