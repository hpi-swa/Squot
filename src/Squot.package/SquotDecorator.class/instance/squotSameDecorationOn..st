keeping decoration
squotSameDecorationOn: anObject
	anObject == decoratedObject ifTrue: [^ self].
	^ (self squotDecoratorClass newFrom: self)
		squotDecoratorDecoratedObject: anObject;
		yourself