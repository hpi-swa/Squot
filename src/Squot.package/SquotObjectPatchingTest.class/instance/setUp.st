running
setUp
	capturer := SquotObjectCapturer new.
	patcher := SquotObjectPatcher new.
	objectRegistry := SquotObjectRegistry new.
	capturer registry: objectRegistry.
	patcher registry: objectRegistry.