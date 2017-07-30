accessing
creatorOf: anObject ifAbsentPut: slotBlock of: creatorBlock
	"Lookup the creator of anObject. If I do not contain it, ask my delegateRegistry and register what it answered."
	| delegated creator slot |
	delegated := false.
	objectCreators at: anObject ifAbsentPut:
		[creator := delegateRegistry
			ifNotNil: [delegated := true.
				delegateRegistry creatorOf: anObject
					ifAbsentPut: [slot := slotBlock value] of: creatorBlock]
			ifNil: [creatorBlock value]].
	objectCreatorSlots at: anObject ifAbsentPut: [slot ifNil: [slotBlock value]].
	delegated ifFalse: [delegateRegistry ifNotNil:
			[delegateRegistry creatorOf: anObject ifAbsentPut: [slot] of: [creator]]].
	^ creator