as yet unclassified
inspectLiveObject
	(graph respondsTo: #objectNamed:ifAbsent:) ifFalse: [^ self].
	^ graph objectNamed: (graph nameOf: self selectedShadow ifAbsent: [^ self]) ifAbsent: [^ self]