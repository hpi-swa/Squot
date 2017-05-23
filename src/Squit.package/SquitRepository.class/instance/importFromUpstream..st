synchronizing
importFromUpstream: remoteName
	self flag: #RemoteRepositoryAPI. "git internals such as remote names should be encapsulated"
	self withCredentialsDo:
		[gitRepository fetchFrom: remoteName].