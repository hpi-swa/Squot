public-operations
pack
	self privateDeprecatedUseUnitOfWork.
	self packsDo: [ :pack | pack delete ].
	packs := nil.
	self packs add: (GitPackFile pack: self)