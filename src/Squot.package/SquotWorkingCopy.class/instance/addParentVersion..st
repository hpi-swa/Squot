creating new versions
addParentVersion: aVersion
	loadedHistorian version ifNil: [^ loadedHistorian version: aVersion].
	(additionalParents ifNil: [additionalParents := OrderedCollection new]) add: aVersion.