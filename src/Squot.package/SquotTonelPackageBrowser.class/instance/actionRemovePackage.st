actions
actionRemovePackage
	(self confirm: ('Really remove package ''{1}''?' format: {self selectedPackageName}))
		ifFalse: [^ self].
	self removePackage: self selectedPackageName.