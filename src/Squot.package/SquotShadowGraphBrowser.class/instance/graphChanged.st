as yet unclassified
graphChanged
	shadows := graph shadows.
	self changed: #objectNames;
		changed: #shadowObjects;
		changed: #liveObjects.