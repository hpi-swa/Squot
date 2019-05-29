synchronizing
export: aHistorian withName: branchString toRemoteNamed: remoteString
	self withCredentialsDo:
		[gitRepository push: {aHistorian name -> branchString} toRemote: remoteString]