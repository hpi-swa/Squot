error handling
errorRemoteUndefined: aGitRemoteUndefined
	self inform: 'Remote ', aGitRemoteUndefined remote name, ' is not configured.'.
	localHistorian untrackUpstream.
	(SquitBadRemote remote: aGitRemoteUndefined remote)
		cause: aGitRemoteUndefined;
		signal.