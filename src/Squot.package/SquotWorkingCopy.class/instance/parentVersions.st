creating new versions
parentVersions
	self flag: #stub. "include merge parents"
	^ Array with: (loadedHistorian version ifNil: [^ Array empty])
	