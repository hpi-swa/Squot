changes-creation
changeSetFromName: aString to: anotherString
	aString = anotherString ifTrue: [^ nil].
	^ GSMetadataNameChangeSet withMapper: self from: aString to: anotherString