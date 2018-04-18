as yet unclassified
rematerialize: aShadow
	| object |
	aShadow hasSquotShadowName ifTrue:
		[object := patchedObjectGraph objectNamed: aShadow name ifAbsent: []].
	object ifNil: [object := materializer rematerialize: aShadow.
		patchedObjectGraph addShadow: aShadow of: object].
	aShadow hasSquotShadowName ifTrue:
		[patchedObjectGraph
			assign: aShadow name to: object;
			assign: aShadow name toShadow: aShadow undecorated].
	^ object