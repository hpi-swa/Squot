running
setUp
	capturer := SquotObjectCapturer new.
	patcher := SquotObjectPatcher new.
	objectRegistry := SquotObjectRegistry2 new.
	capturer registry: objectRegistry.
	patcher registry: objectRegistry.