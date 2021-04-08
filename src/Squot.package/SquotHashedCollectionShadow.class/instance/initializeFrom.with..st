initialize-release
initializeFrom: aHashedCollection with: aCapturer
	self flag: #deprecated. "Ask the mirror instead."
	super initializeFrom: aHashedCollection with: aCapturer.
	self initializeHashedItems: aHashedCollection with: aCapturer.