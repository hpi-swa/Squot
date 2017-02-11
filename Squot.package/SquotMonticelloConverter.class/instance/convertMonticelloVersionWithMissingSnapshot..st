private
convertMonticelloVersionWithMissingSnapshot: aMCVersionInfo
	"Pretend that nothing has changed, but create a commit anyway."
	| squotSnapshot newVersion |
	self assert: aMCVersionInfo ancestors size = 1
		description: 'cannot guess which snapshot to use when there are multiple parents'.
	squotSnapshot := (versionMapFromMonticello at: aMCVersionInfo ancestors first) snapshot.
	self flag: 'TODO: make it possible for backends like git to skip writing a new snapshot'.
	newVersion := squotRepository createNewVersion: squotSnapshot
		with: [:version | version
			initializeClean;
			parents: (aMCVersionInfo ancestors
				collect: [:each | self squotVersionForMonticelloVersionInfo: each]);
			message: aMCVersionInfo message;
			author: aMCVersionInfo author;
			committer: Utilities authorInitials;
			authoringTimeStamp: aMCVersionInfo timeStamp].
	self mapMonticelloVersion: aMCVersionInfo to: newVersion.