instance creation
withChangeSet: aChangeSet from: aString to: anotherString
	^ self
		withChangeSet: aChangeSet
		model: (SquotPlaintextModel withMapper: aChangeSet mapper)
		from: aString
		to: anotherString