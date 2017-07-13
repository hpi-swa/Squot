accessing
creatorOf: anObject ifAbsentPut: slotBlock of: creatorBlock
	"Lookup the creator of anObject. If I do not contain it, ask my delegateRegistry and register what it answered."
	| delegated creator slot |
	delegated := false.
	creator := super creatorOf: anObject
		ifAbsentPut: [delegated := true.
			creator := delegateRegistry creatorOf: anObject
				ifAbsentPut: [slot := slotBlock value] of: creatorBlock]
		of: [creator].
	delegated ifFalse: [delegateRegistry creatorOf: anObject ifAbsentPut: [slot] of: [creator]].
	^ creator