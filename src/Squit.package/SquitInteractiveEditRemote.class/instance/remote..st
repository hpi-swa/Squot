running
remote: aGitRemote
	originalRemote := aGitRemote.
	query := SquitAddRemote new.
	query remoteName: aGitRemote name;
		remoteUrl: aGitRemote url.