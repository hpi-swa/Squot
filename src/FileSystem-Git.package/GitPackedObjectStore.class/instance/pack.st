maintaining
pack
	self packsDo: [ :pack | pack delete ].
	packFiles := nil.
	self packs add: (GitPackFile pack: self)