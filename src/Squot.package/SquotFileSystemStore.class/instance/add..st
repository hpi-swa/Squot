adding and removing
add: anArtifact
	| tableOfContents |
	self store: anArtifact.
	self shouldStoreMetadata ifTrue:
		[(tableOfContents := self tableOfContents) exists
			ifTrue: [tableOfContents add: anArtifact]
			ifFalse: [self guessArtifacts do: [:each | tableOfContents add: each].
				tableOfContents add: anArtifact "with correct metadata"].
		tableOfContents fileOut].
	^ anArtifact