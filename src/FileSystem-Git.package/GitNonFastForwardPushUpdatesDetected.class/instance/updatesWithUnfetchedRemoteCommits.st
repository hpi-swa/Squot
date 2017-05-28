accessing
updatesWithUnfetchedRemoteCommits
	^ relevantRefUpdates select: [:each | each key isString]