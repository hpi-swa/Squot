creating new versions
parentVersions
	| mainParent |
	additionalParents ifNil: [additionalParents := OrderedCollection new].
	mainParent := loadedHistorian version.
	mainParent ifNil: [^ additionalParents].
	^ {mainParent}, (additionalParents copyWithout: mainParent)
	