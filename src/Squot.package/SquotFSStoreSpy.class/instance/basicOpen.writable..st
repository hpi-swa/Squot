spying
basicOpen: aPath writable: aBoolean
	self recordOpened: aPath writable: aBoolean.
	^ watchedStore basicOpen: aPath writable: aBoolean