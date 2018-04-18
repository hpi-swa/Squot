*Squot-trackable-capturing
captureWithSquot: aCapturer
	| replacementOrSelf |
	replacementOrSelf := self squotReplacementFor: aCapturer.
	^ aCapturer
		capture: replacementOrSelf
		as: replacementOrSelf squotShadowFactory