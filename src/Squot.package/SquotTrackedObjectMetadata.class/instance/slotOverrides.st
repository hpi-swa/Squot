private accessing
slotOverrides
	^ self at: #slotOverrides ifAbsentPut: [IdentityDictionary new]