changes-creation
changeSetFromName: aString to: anotherString
	aString = anotherString ifTrue: [^ nil].
	^ SquotMetadataNameChangeSet withMapper: self from: aString to: anotherString