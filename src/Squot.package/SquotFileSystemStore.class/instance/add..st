adding and removing
add: anArtifact
	| tableOfContents storedArtifact |
	storedArtifact := self store: anArtifact.
	self shouldStoreMetadata ifTrue:
		[(tableOfContents := self tableOfContents) exists
			ifTrue: [tableOfContents add: storedArtifact]
			ifFalse: [self guessArtifacts do: [:each | tableOfContents add: each].
				tableOfContents add: storedArtifact "with correct metadata"].
		tableOfContents fileOut].
	^ storedArtifact