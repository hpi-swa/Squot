synchronizing
updateRemoteRepositories
	self withCredentialsDo: [gitRepository fetchFromAll: gitRepository remoteNames].