running
setUp
	capturer := SquotObjectCapturer new.
	patcher := self patcherClass new.
	objectRegistry := SquotObjectRegistry new.
	capturer registry: objectRegistry.
	patcher registry: objectRegistry.