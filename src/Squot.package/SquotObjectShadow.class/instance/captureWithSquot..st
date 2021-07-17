forbid capturing
captureWithSquot: aContentCapturer
	self flag: #deprecated. "Ask the mirror instead."
	self shouldNotImplement. "or rather, should not be called"