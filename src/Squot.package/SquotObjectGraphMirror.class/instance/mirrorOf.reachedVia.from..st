reflection
mirrorOf: anObject reachedVia: aReference from: aGraphDiffOrGraph
	"Answer the mirror collected from traversing the patched graph of the graph diff or the live graph to which the difff is applied. aReference will be a pseudo-reference made from an object diff in the graph diff's list, and referrerObject will be the patched shadow graph or the object graph being patched."
	Mirrors finalizeValues.
	^ (Mirrors at: aGraphDiffOrGraph ifAbsentPut: [IdentityDictionary new])
		at: anObject
		ifAbsent: [(self search: aGraphDiffOrGraph for: anObject)
					ifNil: [(NotFound object: anObject) signal: 'Object not found in graph']]