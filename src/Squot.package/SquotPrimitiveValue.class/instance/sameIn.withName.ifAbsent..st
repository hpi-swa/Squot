accessing
sameIn: aShadowGraph withName: anUndefinedObject ifAbsent: aBlock
	"If the graph contains something like me, it is identical to me. So just answer myself."
	self assert: anUndefinedObject isNil description: 'Primitive objects should not have names'.
	^ self