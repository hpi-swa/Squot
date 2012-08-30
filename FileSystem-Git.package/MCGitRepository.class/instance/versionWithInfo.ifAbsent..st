interface
versionWithInfo: aVersionInfo ifAbsent: aBlock
	(self includesVersionNamed: aVersionInfo name)
		ifFalse: [ ^ aBlock value].
	^ self versionFromFileNamed: aVersionInfo name.