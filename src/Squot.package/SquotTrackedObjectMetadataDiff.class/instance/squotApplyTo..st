Squot-diff-patching
squotApplyTo: metadata
	| new sortedKeys replaced pathPrefix idPath |
	new := metadata copy.
	sortedKeys := diffs keys sorted: [:a :b | a size < b size].
	replaced := Set new.
	pathPrefix := OrderedCollection new.
	"Copy all objects that will change (also if only their referenced objects change)."
	(sortedKeys select: [:each | (diffs at: each) isModification]) do:
		[:eachPath | | object mirror |
		object := new.
		mirror := (thisContext objectClass: object) squotMirror.
		pathPrefix removeAll.
		eachPath allButLast do:
			[:each | | referrer |
			pathPrefix add: each.
			(replaced includes: pathPrefix asArray) ifFalse:
				[referrer := object.
				object := each reflect: referrer in: mirror
							put: (each reflect: referrer in: mirror) copy.
				mirror := mirror mirrorOf: object reachedVia: each from: referrer]]].
	"Apply the differences."
	idPath := {SquotDictionaryEntry key: #id}.
	diffs keysAndValuesDo:
		[:path :diff | | object mirror | (diff isAddition or: [path ~= idPath]) "Ignore all changes in the id, except if it is added." ifTrue:
		[object := new.
		mirror := (thisContext objectClass: object) squotMirror.
		self flag: #todo. "The loop below is actually the traversal of a graph."
		path allButLast do:
			[:each | | referrer |
			referrer := object.
			object := each reflect: referrer in: mirror.
			mirror := mirror mirrorOf: object reachedVia: each from: referrer].
		[diff squotReflectOn: object in: mirror] on: KeyNotFound do: [:e | diff isRemoval ifTrue: [e return] ifFalse: [e pass]]]].
	^ new