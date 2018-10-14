initialize-release
initializeRemoteUrl
	| clipboardString |
	clipboardString := Clipboard clipboardText asString.
	((clipboardString beginsWith: 'http:') or: [clipboardString beginsWith: 'https:'])
		ifTrue: [self remoteUrl: clipboardString]
		ifFalse: [self remoteUrl: ''].