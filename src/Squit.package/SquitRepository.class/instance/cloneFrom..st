synchronizing
cloneFrom: remoteUrl
	self withCredentialsDo: [gitRepository cloneFrom: remoteUrl].