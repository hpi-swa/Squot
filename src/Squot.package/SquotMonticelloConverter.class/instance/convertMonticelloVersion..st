private
convertMonticelloVersion: aMCVersionInfo
	| squotPatch newVersion |
	squotPatch := self captureSquotPatchFrom: aMCVersionInfo
		basedOnVersion: (aMCVersionInfo ancestors
			ifEmpty: []
			ifNotEmpty: [:ancestors | ancestors first]).
	squotPatch ifNil: [^ self convertMonticelloVersionWithMissingSnapshot: aMCVersionInfo].
	newVersion := squotRepository createNewVersionFromPatch: squotPatch
		with: [:version | version
			initializeClean;
			parents: (aMCVersionInfo ancestors
				collect: [:each | self squotVersionForMonticelloVersionInfo: each]);
			message: aMCVersionInfo message;
			author: aMCVersionInfo author;
			committer: (squotRepository extension: #authorInformation
				ifPresent: [:authorInformation | authorInformation defaultAuthor]
				ifAbsent: [Utilities authorInitials]);
			authoringTimeStamp: aMCVersionInfo timeStamp].
	self mapMonticelloVersion: aMCVersionInfo to: newVersion.