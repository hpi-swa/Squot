testing
canHaveReferences: anObject
	class isImmediateClass ifTrue: [^ false].
	class = UndefinedObject ifTrue: [^ false].
	class isVariable ifTrue: [^ true].
	(class inheritsFrom: Boolean) ifTrue: [^ false].
	class squotMirror = SquotSystemSingletonMirror ifTrue: [^ false].
	anObject isCollection ifTrue: [^ true].
	^ true