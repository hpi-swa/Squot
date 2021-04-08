*Squot-trackable-capturing
captureWithSquot: aCapturer
	| replacementOrSelf |
	self flag: #deprecated. "Ask the mirror instead."
	replacementOrSelf := self squotReplacementFor: aCapturer.
	^ aCapturer
		capture: replacementOrSelf
		as: replacementOrSelf squotShadowFactory