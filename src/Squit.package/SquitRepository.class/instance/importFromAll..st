synchronizing
importFromAll: remoteNames
	self flag: #RemoteRepositoryAPI. "git internals such as remote names should be encapsulated"
	self withCredentialsDo:
		[gitRepository fetchFromAll: remoteNames].