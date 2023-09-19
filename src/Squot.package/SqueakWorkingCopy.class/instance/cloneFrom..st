git-operations
cloneFrom: aStringOrUrl
	self handleCredentialsDuring: [
		self fsgitRepository
			addRemote: 'origin' url: aStringOrUrl asUrl;
			fetchFrom: 'origin'].