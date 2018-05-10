as yet unclassified
liveObjects
	(graph respondsTo: #objectNamed:) ifFalse: [^ Array empty].
	^ shadows collect: [:each | graph objectNamed: (graph nameOf: each) ifAbsent: ['']]