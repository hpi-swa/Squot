applying
parentVersions
	| mainParent |
	mainParent := historian version.
	mainParent ifNil: [^ additionalParentVersions asArray].
	additionalParentVersions ifEmpty: [^ Array with: mainParent].
	^ {mainParent}, (additionalParentVersions copyWithout: mainParent)
	