accessing
icon
	(self isActive or: [self isDetachedHead]) ifTrue: [^ ToolIcons testGreen].
	self isRemoteRef ifTrue: [^ ToolIcons arrowUp].
	self isSqueakRef ifFalse: [^ SquotBrowser gitIcon scaledToSize: 24 @ 24].
	^ ToolIcons blank