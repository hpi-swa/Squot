capturing
capture: anObject
	| shadow |
	shadow := anObject captureWithSquot: self.
	self rememberAsShadowOfCapturedObject: shadow. "this is redundant, but a safeguard against shadow implementations that fail to register the shadow via shadowAt:ifAbsentPut:"
	objectGraph addShadow: shadow of: capturedObject.
	^ shadow