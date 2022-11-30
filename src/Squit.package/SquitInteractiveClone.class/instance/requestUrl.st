private
requestUrl
	| clipboardUrl |
	remoteUrl ifNil:
		[clipboardUrl := Clipboard clipboardText.
		remoteUrl := (self isRemoteSupported: clipboardUrl) ifTrue: [clipboardUrl] ifFalse: ['https://']].
	remoteUrl := SquotGUI request: 'URL to clone from:' initialAnswer: remoteUrl.
	remoteUrl isEmptyOrNil ifTrue: [^ nil].
	(self isRemoteSupported: remoteUrl)
		ifFalse: [self inform: 'This URL is not supported at the moment.'. ^ nil].
	^ remoteUrl