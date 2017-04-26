user requests
offerToAddRemoteTo: gitRepository ifAccepted: acceptBlock ifCanceled: cancelBlock
	| newRemoteNames |
	(UIManager default confirm: 'No useable remote (http only) found. Would you like to add one?')
		ifFalse: [^ cancelBlock value].
	self actionRemoteAdd.
	newRemoteNames := self chooseableRemoteNamesFrom: gitRepository.
	newRemoteNames ifEmpty: [^ cancelBlock value].
	^ acceptBlock value: newRemoteNames