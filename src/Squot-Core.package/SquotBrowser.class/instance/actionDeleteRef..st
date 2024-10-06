actions
actionDeleteRef: aString
	(self activeWorkingCopy checkCanDeleteRef: aString) ifFalse: [^ self].
	(self confirm:
		('Are you sure you want to delete the ref {1}?'
			format: {(GitReference shortName: aString) printString}))
		ifFalse: [^ self].
	self unitOfWork deleteRef: aString.