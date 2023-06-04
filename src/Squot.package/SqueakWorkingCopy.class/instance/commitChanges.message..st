git-operations
commitChanges: aDictionary message: aString
	| newCommit |
	newCommit := self commitChanges: aDictionary onCommit: self headCommit message: aString.
	self unitOfWork updateRef: self headRefName to: newCommit hash message: 'commit: ', aString.
	^ newCommit