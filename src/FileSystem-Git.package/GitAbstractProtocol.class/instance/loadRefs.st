private
loadRefs
	self withOpenConnection: [self discoverReferencesForService: 'git-upload-pack'].
	^ refs