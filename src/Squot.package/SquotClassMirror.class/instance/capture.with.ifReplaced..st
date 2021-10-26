capturing
capture: aClass with: aSquotObjectCapturer ifReplaced: aBlock
	aClass isMeta ifTrue: [self error: 'Should capture class, not metaclass'].
	^ SquotClassShadow
		forPackageNamed: aClass category
		withSnapshot: (MCSnapshot fromDefinitions: (Array streamContents: [:stream |
			stream nextPutAll: aClass classDefinitions.
			aClass selectorsDo: [:each | stream nextPut: (MethodReference class: aClass selector: each) asMethodDefinition]]))