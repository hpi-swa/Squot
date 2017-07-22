as yet unclassified
rematerialize: aShadow
	| object |
	patchedObjects at: aShadow undecorated
		ifPresent: [:it | ^ it].
	aShadow hasSquotShadowName ifTrue:
		[object := patchedObjectGraph objectNamed: aShadow name ifAbsent: []].
	object ifNil: [object := materializer rematerialize: aShadow.
		patchedObjectGraph addShadow: aShadow of: object].
	aShadow hasSquotShadowName ifTrue:
		[patchedObjectGraph
			assign: aShadow name to: object;
			assign: aShadow name toShadow: aShadow].
	object squotShouldKeepIdentity ifTrue:
		[patchedObjects at: aShadow undecorated put: object].
	^ object