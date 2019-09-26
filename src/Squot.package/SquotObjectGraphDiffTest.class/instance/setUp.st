running
setUp
	objectRegistry := SquotObjectRegistry new.
	capturer := SquotObjectCapturer new.
	capturer registry: objectRegistry.