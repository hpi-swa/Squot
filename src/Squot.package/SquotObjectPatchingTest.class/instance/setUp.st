running
setUp
	capturer := SquotObjectCapturer new.
	patcher := SquotPatcher new.
	objectRegistry := SquotObjectRegistry new.
	capturer registry: objectRegistry.
	patcher registry: objectRegistry.