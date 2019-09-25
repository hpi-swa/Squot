tests
testNilDoesNotInheritNameOfGarbageCollectedObject
	"When objects are garbage collected, the keys in the names hash table become nil.
	This must not mislead the registry to answer that nil had one of the names of the former
	objects!"
	| hashTable |
	"Craft a registry where all keys were freed.
	This is tightly coupled to the WeakKeyDictionary, SquotObjectRegistry and 
	SquotShadowGraph implementation!"
	hashTable := ((registry instVarNamed: 'graphForStorage') instVarNamed: 'objectNames') array.
	hashTable replace: [:each | WeakKeyAssociation key: nil value: Object new].
	self assert: (registry nameOf: nil ifAbsent: []) isNil.