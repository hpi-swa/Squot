user requests
offerToAddRemoteTo: gitRepository
	"Show GUI to add a remote, answer the new remote name or nil if cancelled.
	Blocks the calling process, do not call this from the UI process!"
	| addResult promise |
	(UIManager default confirm: 'No useable remote (http only) found. Would you like to add one?')
		ifFalse: [^ nil].
	promise := self future actionRemoteAdd
		then: 
			[:aSquitAddRemote | addResult := aSquitAddRemote]
		ifRejected:
			[:reason | addResult := nil].
	self waitFor: promise.
	addResult ifNil: [^ nil].
	^ addResult remoteName