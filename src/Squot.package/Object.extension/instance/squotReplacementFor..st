*Squot-trackable-capturing
squotReplacementFor: aCapturer
	"Answer an object that shall take my place in the captured object graph."
	self flag: #deprecated. "Ask the mirror instead."
	^ self objectForDataStream: aCapturer