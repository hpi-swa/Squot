accessing
saveOperation
	^ save ifNil: [save := self workingCopy newSaveOperation]