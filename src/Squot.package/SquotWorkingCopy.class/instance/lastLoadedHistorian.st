accessing
lastLoadedHistorian

	^ lastLoadedHistorian ifNil:
		[lastLoadedHistorian := repository metaHistorianForLastLoadedVersion
			version: loadedHistorian version;
			yourself]