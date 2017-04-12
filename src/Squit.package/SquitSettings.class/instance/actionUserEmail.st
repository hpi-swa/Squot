actions
actionUserEmail
	^ userEmail ifNil: [GitStamp defaultEmail]