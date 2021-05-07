git protocol clients
pushReferences: updateAssociations of: aRepository deleting: deleteRefs
	| packFile |
	self client userAgent: 'git/2.0.5'.
	UIManager default informUser: 'Pushing to ', url asString during:
		[self withOpenConnection: [
			self discoverReferencesForService: 'git-receive-pack'.
			self ifAllUpToDate: updateAssociations andDeleted: deleteRefs
				do: [^ GitReceivePackStatusReport alreadyUpToDate].
			self checkForNonFastForwardUpdates: updateAssociations with: aRepository unitOfWork.
			(updateAssociations notEmpty)
				ifTrue: [packFile := self preparePackFileToPushRefs: updateAssociations of: aRepository]
				ifFalse: [packFile := nil].
			[^ self invokeReceivePackWithRefs: updateAssociations andPack: packFile deleting: deleteRefs]
			ensure: [packFile ifNotNil: [packFile delete]]]]