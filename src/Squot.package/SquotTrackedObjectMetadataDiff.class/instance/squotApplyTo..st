Squot-diff-patching
squotApplyTo: metadata
	| new sortedKeys replaced pathPrefix |
	new := metadata copy.
	sortedKeys := diffs keys sorted: [:a :b | a size < b size].
	replaced := Set new.
	pathPrefix := OrderedCollection new.
	"Copy all objects that will change (also if only their referenced objects change)."
	(sortedKeys select: [:each | (diffs at: each) isModification]) do:
		[:eachPath | | object |
		object := new.
		pathPrefix removeAll.
		eachPath allButLast do:
			[:each |
			pathPrefix add: each.
			(replaced includes: pathPrefix asArray) ifFalse:
				[object :=
					each reflect: object in: (thisContext objectClass: object) squotMirror
						put: (each reflect: object in: (thisContext objectClass: object) squotMirror) copy]]].
	"Apply the differences."
	diffs keysAndValuesDo:
		[:path :diff | | object |
		object := new.
		self flag: #todo. "The loop below is actually the traversal of a graph."
		path allButLast do:
			[:each | object := each reflect: object
								in: (thisContext objectClass: object) squotMirror].
		self flag: #generality. "Type discrimination below. Not open for other kinds of differences and implements the nature of the differences by itself."
		diff isAddition ifTrue: [path last addTo: object withValue: diff addedObject].
		diff isModification ifTrue:
			[path last reflect: object in: (thisContext objectClass: object) squotMirror put: diff incoming].
		diff isRemoval ifTrue: [path last removeFrom: object]].
	^ new