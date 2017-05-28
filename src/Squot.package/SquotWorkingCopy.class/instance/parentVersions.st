creating new versions
parentVersions
	| mainParent |
	additionalParents ifNil: [self resetAdditionalParents].
	mainParent := loadedHistorian version.
	mainParent ifNil: [^ additionalParents].
	^ {mainParent}, (additionalParents copyWithout: mainParent)
	