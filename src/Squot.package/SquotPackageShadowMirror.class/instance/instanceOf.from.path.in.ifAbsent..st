accessing
instanceOf: aPackageShadow from: sourceShadowGraph path: aSequenceableCollection in: searchShadowGraph ifAbsent: absentBlock 
	| id other |
	"Usually the package shadow is the root of the graph, but let's be thorough."
	aSequenceableCollection size > 1 ifTrue: [self isThisEverCalled].
	id := sourceShadowGraph nameOf: aPackageShadow undecorated.
	other := searchShadowGraph shadowNamed: id ifAbsent: [^ absentBlock value].
	^ aPackageShadow packageName = other packageName
		ifTrue: [other]
		ifFalse: [absentBlock value]