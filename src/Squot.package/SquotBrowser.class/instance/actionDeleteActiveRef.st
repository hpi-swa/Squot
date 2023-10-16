actions
actionDeleteActiveRef
	self activeRef ifNil: [^ self inform: 'Please select a ref first.'].
	(self activeWorkingCopy checkCanDeleteRef: self activeRef) ifFalse: [^ self].
	(self confirm:
		('Are you sure you want to delete the ref ''{1}''?'
			format: {GitReference shortName: self activeRef}))
		ifFalse: [^ self].
	self unitOfWork deleteRef: self activeRef.