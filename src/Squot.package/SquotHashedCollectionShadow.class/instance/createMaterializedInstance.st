rematerializing
createMaterializedInstance
	^ originalClass new: (slots at: self metaSlotName) size