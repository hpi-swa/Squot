private
convertMonticelloVersionWithMissingSnapshot: aMCVersionInfo
	"Pretend that nothing has changed, but create a commit anyway."
	| newVersion |
	self assert: aMCVersionInfo ancestors size = 1
		description: 'cannot guess which snapshot to use when there are multiple parents'.
	newVersion := squotRepository
		createNewVersionFromPatch:
			(SquotPatch noChangesTo:
				(self squotVersionForMonticelloVersionInfo: aMCVersionInfo ancestors first))
		with: [:version | version
			initializeClean;
			parents: (aMCVersionInfo ancestors
				collect: [:each | self squotVersionForMonticelloVersionInfo: each]);
			message: aMCVersionInfo message;
			author: aMCVersionInfo author;
			committer: Utilities authorInitials;
			authoringTimeStamp: aMCVersionInfo timeStamp].
	self mapMonticelloVersion: aMCVersionInfo to: newVersion.