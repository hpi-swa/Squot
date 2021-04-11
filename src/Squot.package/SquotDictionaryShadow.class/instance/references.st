reflection
references
	"Add additional pseudo references to the keys, so the associations will not be put into the dictionary before the keys are materialized."
	| realReferences associationReferences |
	realReferences := super references.
	associationReferences := realReferences last: itemSlots size.
	^ (realReferences allButLast: itemSlots size),
		(associationReferences withIndexCollect:
			[:each :index | SquotEntangledReference entangle:
						{each.
						SquotPseudoReference target: ((itemSlots at: index) value instVarSlotNamed: 'key')}]) flatten
			"Note: that the key is materialized before the association currently relies on the order in which the references are returned here and how they are processed by the materializer's graph walk."