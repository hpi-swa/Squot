private
compareClassNodes: a and: b
	| categoryIndexA categoryIndexB |
	categoryIndexA := classCategories indexOf: a content classDefinition category.
	categoryIndexB := classCategories indexOf: b content classDefinition category.
	^ categoryIndexA ~= categoryIndexB
		ifTrue: [categoryIndexA <= categoryIndexB]
		ifFalse: [a title asString <= b title asString]