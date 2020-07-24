user requests
offerToAddRemoteTo: gitRepository ifAccepted: acceptBlock ifCanceled: cancelBlock
	| newRemoteNames |
	(self confirm: 'No useable remote (http only) found. Would you like to add one?')
		ifFalse: [^ cancelBlock value].
	^ self actionRemoteAdd
		then: 
			[:x | self withUnitOfWork:
				[newRemoteNames := self chooseableRemoteNamesFrom: gitRepository.
				newRemoteNames
					ifEmpty: [Promise new rejectWith: cancelBlock value]
					ifNotEmpty: [acceptBlock value: newRemoteNames]]]
		ifRejected:
			[:reason | Promise new rejectWith: cancelBlock value]