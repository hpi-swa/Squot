creating versions
createNewVersionFromPatch: aPatch with: aBlock
	| newVersion |
	newVersion := self repository createNewVersionFromPatch: aPatch
		with: [:version | version
			parents: (self version
				ifNil: [OrderedCollection new]
				ifNotNil: [:it | OrderedCollection with: it]);
			in: aBlock].
	self git
		updateRef: self expandedName
		to: newVersion hexHash
		message: 'commit: ', (newVersion message lineNumber: 1).
	^ newVersion