flags
remoteRepository
	<flag: 'Squot has no first-class concept of remote repositories in the API for now. Everything that involves Git remotes uses Squit-specific API.'>
	"This flag is used in methods that could have such a concept applied if it is introduced."
	"It is conceivable to have special remote repository objects with remote historians. Push, fetch and pull could then be realized through import and export of historians between repositories. Remote-tracking branches are like a snapshot of the historians of a remote repository. Remote-tracking historians are past versions of their real historians in the real remote repository."