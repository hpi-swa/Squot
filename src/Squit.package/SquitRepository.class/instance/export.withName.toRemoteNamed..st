synchronizing
export: aHistorian withName: branchString toRemoteNamed: remoteString
	self withCredentialsDo:
		[[gitRepository push: {aHistorian name -> branchString} toRemote: remoteString]
			on: GitRefDoesNotExistYet do:
				[:error | SquotCannotExportEmptyHistory new
					historian: aHistorian;
					signal: error messageText]]