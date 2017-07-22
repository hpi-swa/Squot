private accessing
ignoredInstanceVariables
	^ self at: #ignoredInstanceVariables ifAbsentPut: [IdentityDictionary new]