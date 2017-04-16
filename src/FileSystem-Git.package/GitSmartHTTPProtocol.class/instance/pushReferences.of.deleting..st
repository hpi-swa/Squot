git protocol clients
pushReferences: updateAssociations of: aRepository deleting: deleteRefs
	| packFile |
	self requestCredentials.
	self client userAgent: 'git/2.0.5'.
	'Pushing to ', url asString displaySequentialProgress:
		[self withOpenConnection: [
			self discoverReferencesForService: 'git-receive-pack'.
			(updateAssociations notEmpty)
				ifTrue: [packFile := self preparePackFileToPushRefs: updateAssociations of: aRepository]
				ifFalse: [packFile := nil].
			[^ self invokeReceivePackWithRefs: updateAssociations andPack: packFile deleting: deleteRefs]
			ensure: [packFile ifNotNil: [packFile delete]]]]