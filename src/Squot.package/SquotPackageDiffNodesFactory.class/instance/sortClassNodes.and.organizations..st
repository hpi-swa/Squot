private
sortClassNodes: a and: b organizations: aCollection
	| categoryA categoryIndexA categoryB categoryIndexB |
	categoryA := a content classDefinition category.
	categoryB := b content classDefinition category.
	aCollection detect: [:each | (categoryIndexA := each categories indexOf: categoryA) ~= 0] ifNone: [].
	aCollection detect: [:each | (categoryIndexB := each categories indexOf: categoryB) ~= 0] ifNone: [].
	^ categoryIndexA ~= categoryIndexB
		ifTrue: [categoryIndexA <= categoryIndexB]
		ifFalse: [a title asString <= b title asString]