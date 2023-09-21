sound
playSound
	self sound
		ifNil: [^ self];
		play.
	self updateButton.
	[SoundPlayer waitUntilDonePlaying: self sound.
	self updateButton] fork.