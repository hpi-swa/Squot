accessing
newVersionMessage
	^ newVersionMessage ifNil: [SquotInitialLogMessageRequested signal ifNil: ['']]