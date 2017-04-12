actions
actionUserName
	^ userName ifNil: [GitStamp defaultName]