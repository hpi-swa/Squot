actions
actionRemovePackage
	(self confirm: ('Really remove package ''{1}''?' format: {self selectedPackageName}))
		ifFalse: [^ self].
	self workingCopy mappers remove: self selectedMapper.
	self mappersChanged.