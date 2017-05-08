creating new versions
parentVersions
	additionalParents ifNil: [additionalParents := OrderedCollection new].
	loadedHistorian version ifNil: [^ additionalParents].
	^ {loadedHistorian version}, additionalParents
	