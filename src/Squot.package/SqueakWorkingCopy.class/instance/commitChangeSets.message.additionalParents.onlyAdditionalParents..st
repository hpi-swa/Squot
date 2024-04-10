git-operations
commitChangeSets: aCollection
message: aString
additionalParents: anotherCollection
onlyAdditionalParents: aBoolean
	^ self withUnitOfWork: [
		| newCommit |
		newCommit := self
							commitChangeSets: aCollection
							onCommit: self headCommit
							message: aString
							additionalParents: anotherCollection
							onlyAdditionalParents: aBoolean.
		self updateHeadTo: newCommit message: 'commit: ', aString.
		newCommit]