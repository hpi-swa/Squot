public-operations
pack
	self packsDo: [ :pack | pack delete ].
	packs := nil.
	self packs add: (GitPackFile pack: self)