event handling
mouseUp: anEvent
	self isPlaying
		ifTrue: [self stopSound]
		ifFalse: [self playSound]