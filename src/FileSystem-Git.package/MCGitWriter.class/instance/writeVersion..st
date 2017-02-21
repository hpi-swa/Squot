visiting
writeVersion: aVersion
	aVersion isDiffy
		ifTrue: [ self writePatch: aVersion patch ]
		ifFalse: [ self writeSnapshot: aVersion snapshot].
	self syncSources.