accessing-references
followSymbolicRefs: aString
	self privateDeprecatedUseUnitOfWork.
	^ self followSymbolicRefs: aString do: [:ref | ]