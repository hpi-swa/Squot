adding and removing
removeAt: path
	| tableOfContents |
	self removeFilesFrom: path.
	self shouldStoreMetadata ifTrue:
		[(tableOfContents := self tableOfContents) exists
			ifTrue: [tableOfContents removeAt: path]
			ifFalse: [self guessArtifacts do: [:each | tableOfContents add: each]].
		tableOfContents fileOut].