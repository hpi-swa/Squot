packages
packageSerializer
	^ (workingCopy project artifacts
		detect: [:each | each storeInfo hasReferenceOfType: 'package']
		ifNone: [^ nil]) storeInfo serializer