running
setUp
	objectRegistry := SquotObjectRegistry2 new.
	capturer := SquotObjectCapturer new.
	capturer registry: objectRegistry.
	materializer := SquotShadowMaterializer new.
	materializer registry: objectRegistry