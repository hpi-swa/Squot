sound
stopSound
	self sound
		ifNil: [^ self];
		pause;
		reset.
	self updateButton.