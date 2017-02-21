initialize
on: aCollectionOrStream
	aCollectionOrStream isStream ifTrue: [
		sourceStartPosition := aCollectionOrStream position ].
	
	super on: aCollectionOrStream