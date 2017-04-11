creating new versions
addParentVersion: aVersion
	(additionalParents ifNil: [additionalParents := OrderedCollection new]) add: aVersion.