initialize-release
initializeFrom: anObject andItsCopy: copyOfAnObject with: metaobjectBuilder
	super initializeFrom: anObject andItsCopy: copyOfAnObject with: metaobjectBuilder.
	collection := Array streamContents: [:captured |
		anObject associationsDo: [:each |
			captured nextPut: (metaobjectBuilder squotContentFrom: each)]].