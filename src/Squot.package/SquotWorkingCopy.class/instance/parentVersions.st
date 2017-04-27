creating new versions
parentVersions
	loadedHistorian version ifNil: [^ additionalParents].
	^ {loadedHistorian version}, additionalParents
	