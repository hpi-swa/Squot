changes-creation
changeSetsFromFSCommit: anFSCommit toFSCommit: anotherFSCommit in: aWorkingCopy
	| metadatas |
	metadatas := self
		loadMetadatasWithUntrackedMappersFromFSCommits: {anFSCommit. anotherFSCommit}
		in: aWorkingCopy.
	^ self
		changeSetsFromMetadata: metadatas first
		toMetadata: metadatas second
		old: [:old :empty | old changeSetFromFSCommit: anFSCommit toFSCommit: empty]
		common: [:common | common changeSetFromFSCommit: anFSCommit toFSCommit: anotherFSCommit]
		new: [:new :empty | new changeSetFromFSCommit: empty toFSCommit: anotherFSCommit]
		in: aWorkingCopy