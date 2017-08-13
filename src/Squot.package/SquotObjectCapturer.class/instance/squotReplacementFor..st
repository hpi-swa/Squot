Squot-trackable
squotReplacementFor: aCapturer
	"I do not want to be captured myself! This is probably an accident."
	"Warning signal: 'Attempted to capture the capturer'."
	aCapturer replace: self with: nil.
	^ nil