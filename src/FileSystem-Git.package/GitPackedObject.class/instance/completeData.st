accessing
completeData
	| savedPosition nBytes |
	savedPosition := self sourceStream position.
	[nBytes := self stopPosition - self startPosition.
	self sourceStream position: self startPosition.
	^ self sourceStream next: nBytes]
	ensure: [self sourceStream position: savedPosition].