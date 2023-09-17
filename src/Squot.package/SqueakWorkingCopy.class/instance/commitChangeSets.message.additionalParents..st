git-operations
commitChangeSets: aCollection message: aString additionalParents: anotherCollection
	^ self withUnitOfWork: [
		| newCommit |
		newCommit := self
							commitChangeSets: aCollection
							onCommit: self headCommit
							message: aString
							additionalParents: anotherCollection.
		self unitOfWork updateRef: self headRefName to: newCommit hash message: 'commit: ', aString.
		newCommit]