creating new versions
parentVersions
	| mainParent |
	mainParent := loadedHistorian version.
	mainParent ifNil: [^ self additionalParents asArray].
	additionalParents ifNil: [^ Array with: mainParent].
	^ {mainParent}, (additionalParents copyWithout: mainParent)
	