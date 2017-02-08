private
convertMonticelloVersion: aMCVersionInfo
	| squotSnapshot newVersion |
	squotSnapshot := self captureSquotSnapshotFrom: aMCVersionInfo
		basedOnVersion: (aMCVersionInfo ancestors
			ifEmpty: []
			ifNotEmpty: [:ancestors | ancestors anyOne]).
	newVersion := squotRepository createNewVersion: squotSnapshot
		with: [:version | version
			parents: (aMCVersionInfo ancestors
				collect: [:each | self squotVersionForMonticelloVersionInfo: each]);
			message: aMCVersionInfo message;
			author: aMCVersionInfo author;
			committer: Utilities authorInitials;
			authoringTimeStamp: aMCVersionInfo timeStamp].
	self mapMonticelloVersion: aMCVersionInfo to: newVersion.