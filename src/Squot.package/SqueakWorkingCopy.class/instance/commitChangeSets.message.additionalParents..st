git-operations
commitChangeSets: aCollection message: aString additionalParents: anotherCollection
	^ self withUnitOfWork: [
		| newCommit |
		newCommit := self
							commitChangeSets: aCollection
							onCommit: self headCommit
							message: aString
							additionalParents: anotherCollection.
		self updateHeadTo: newCommit message: 'commit: ', aString.
		newCommit]