applying
validateRequestor
	(self requestor respondsTo: #getShouldRevertCherryPickedChanges)
		ifFalse: [self error: 'Unsuitable requestor'].