accessing
lastLoadedHistorian

	^ lastLoadedHistorian ifNil:
		[lastLoadedHistorian := (repository historianNamed: 'refs/meta/squot-loaded')
			version: loadedHistorian version;
			yourself]