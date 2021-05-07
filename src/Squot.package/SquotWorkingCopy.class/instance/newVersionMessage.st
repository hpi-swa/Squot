accessing
newVersionMessage
	^ newVersionMessage ifNil: [SquotInitialLogMessageRequested signal]