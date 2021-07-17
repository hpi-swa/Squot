reflection
mirrorOf: anObject reachedVia: aReference from: aGraphDiffOrGraph
	"Answer the mirror collected from traversing the patched graph of the graph diff or the live graph to which the difff is applied. aReference will be a pseudo-reference made from an object diff in the graph diff's list, and referrerObject will be the patched shadow graph or the object graph being patched."
	| notFound |
	Mirrors finalizeValues.
	^ [(Mirrors at: aGraphDiffOrGraph ifAbsentPut: [IdentityDictionary new])
		at: anObject
		ifAbsent: [(self search: aGraphDiffOrGraph for: anObject)
					ifNil: [(notFound := Warning new messageText: 'Object not found in graph') signal.
						"Assume that it is the new object from a replacement"
						self defaultMirrorOf: anObject]]]
		on: Warning do:
			[:w | (w == notFound and: [aReference objectDiff class = SquotObjectReplacement])
				ifTrue: [w resume]
				ifFalse: [w pass]]