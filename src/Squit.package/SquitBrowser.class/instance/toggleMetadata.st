actions on working copies
toggleMetadata
	| newValue |
	newValue := self projectSelection shouldStoreMetadata not.
	newValue ifFalse:
		[(self confirm: 'This is not about ancestry or method timestamps, but about the .squot and .squot-contents files in the repository.
Without these, the load order of packages and other objects becomes undefined.
Do you really need to disable these?' withCRs)
			ifFalse: [^ self]].
	self projectSelection shouldStoreMetadata: newValue.