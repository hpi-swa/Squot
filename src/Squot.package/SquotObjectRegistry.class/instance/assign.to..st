as yet unclassified
assign: aName to: anObject
	aName = SquotShadowGraph anonymousObjectName ifTrue: [^ self]. "The object would not ordinarily have a name, but needs to have one in the graph for technical reasons. However, it should not be included in the registry."
	^ graphForStorage assign: aName to: anObject