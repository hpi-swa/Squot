running
setUp
	capturer := SquotObjectCapturer new.
	patcher := SquotNewObjectPatcher new.
	objectRegistry := SquotObjectRegistry new.
	capturer registry: objectRegistry.
	patcher registry: objectRegistry.