git-operations
commitChangeSets: aCollection message: aString
	^ self withUnitOfWork: [
		| newCommit |
		newCommit := self commitChangeSets: aCollection onCommit: self headCommit message: aString.
		self unitOfWork updateRef: self headRefName to: newCommit hash message: 'commit: ', aString.
		newCommit]