user requests
offerToAddRemoteTo: gitRepository
	"Show GUI to add a remote, answer the new remote name or nil if cancelled.
	Blocks the calling process, do not call this from the UI process!"
	| addResult |
	(UIManager default confirm: 'No useable remote (http only) found. Would you like to add one?')
		ifFalse: [^ nil].
	(self future actionRemoteAdd
		then: 
			[:aSquitAddRemote | addResult := aSquitAddRemote]
		ifRejected:
			[:reason | addResult := nil])
		wait.
	addResult ifNil: [^ nil].
	^ addResult remoteName