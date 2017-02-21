accessing
deltaQueue
	^ deltaQueue ifNil: [ deltaQueue := OrderedCollection new ]