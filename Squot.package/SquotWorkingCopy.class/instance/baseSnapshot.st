creating new versions
baseSnapshot
	^ loadedHistorian version
		ifNotNil: [:version | version snapshot]
		ifNil: [SquotSnapshot empty].