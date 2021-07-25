testing
canHaveReferences: aSquotObjectShadow 
	| class |
	class := aSquotObjectShadow originalClass.
	class isImmediateClass ifTrue: [^ false].
	class isVariable ifTrue: [^ true].
	(class squotMirror isKindOf: SquotSystemSingletonMirror) ifTrue: [^ false].
	^ true