Squot-diff-patching
squotApplyTo: metadata
	| new |
	new := metadata veryDeepCopy.
	diffs keysAndValuesDo:
		[:path :diff | | object |
		object := new.
		path allButLast do:
			[:each | object := each reflect: object
								in: (thisContext objectClass: object) squotMirror].
		diff isAddition ifTrue: [path last addTo: object withValue: diff addedObject].
		diff isModification ifTrue:
			[path last reflect: object in: (thisContext objectClass: object) squotMirror put: diff incoming].
		diff isRemoval ifTrue: [path last removeFrom: object]].
	^ new