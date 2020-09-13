progress output
updateProgress: aNumber text: aString
	^ ProgressNotification signal: aNumber extra: aString