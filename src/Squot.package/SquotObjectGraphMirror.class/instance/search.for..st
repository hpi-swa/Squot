private
search: aGraphDiffOrGraph for: anObject
	| start walk mirrors |
	start := aGraphDiffOrGraph roots collect: [:each | each undecorated].
	walk := SquotGraphWalk startingFrom: (start first -> (self defaultMirrorOf: start first)).
	walk doNotTrackReferrers; useBreadthFirstTraversal.
	start allButFirstDo: [:each | walk add: each -> (self defaultMirrorOf: each) path: #()].
	start do: [:each | walk checkPathsTo: each ifMultiple: []].
	mirrors := Mirrors at: aGraphDiffOrGraph.
	"Find correct mirrors by searching the graph from the start."
	[walk atEnd] whileFalse:
		[| next searchObject searchMirror | next := walk next.
		searchObject := next key. searchMirror := next value.
		mirrors at: searchObject put: searchMirror.
		searchObject == anObject ifTrue: [^ searchMirror].
		(searchMirror referencesFrom: searchObject) do:
			[:each | | value valueMirror skip |
			value := (each reflect: searchObject in: searchMirror) undecorated.
			valueMirror := searchMirror mirrorOf: value reachedVia: each from: searchObject.
			walk checkPathsTo: value ifMultiple: [skip := true].				
			skip == true ifFalse:
				[walk add: value -> valueMirror reachedVia: each]]].
	^ mirrors at: anObject ifAbsent: []