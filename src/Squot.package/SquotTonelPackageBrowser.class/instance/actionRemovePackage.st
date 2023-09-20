actions
actionRemovePackage
	(self confirm: ('Really remove package ''{1}''?' format: {self selectedPackageName}))
		ifFalse: [^ self].
	self workingCopy removeMapper: self selectedMapper.