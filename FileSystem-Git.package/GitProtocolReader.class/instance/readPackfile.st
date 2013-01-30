private receiving
readPackfile
	|  objects |
	self isThisEverCalled.
	objects := OrderedCollection new.
	
	self readLines: [ :line| 
		| isContent code |
		code := line first.
		isContent := (code == 1 asCharacter).
		isContent 
			ifFalse: [ Transcript show: (line allButFirst: 1); cr. ]
			ifTrue: [ objects add: (GitPackedObject loadFrom: (line allButFirst: 1) readStream)]
	].

	^ objects