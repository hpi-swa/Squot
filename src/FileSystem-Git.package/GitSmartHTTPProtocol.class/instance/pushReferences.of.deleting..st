git protocol clients
pushReferences: updateAssociations of: aRepository deleting: deleteRefs
	| packFile |
	self requestCredentials.
	self withOpenConnection: [
		self discoverReferencesForService: 'git-receive-pack'.
		(updateAssociations notEmpty)
			ifTrue: [packFile := self preparePackFileToPushRefs: updateAssociations of: aRepository]
			ifFalse: [packFile := nil].
		^ self invokeReceivePackWithRefs: updateAssociations andPack: packFile deleting: deleteRefs]