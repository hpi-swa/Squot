packages
packageSerializer
	^ (workingCopy project artifacts
		detect: [:each | each storeInfo references anySatisfy: [:eachReference | (eachReference at: 'type') = 'package']]
		ifNone: [^ nil]) storeInfo serializer