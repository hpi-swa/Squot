actions
actionRemoteAdd
	| name url |
	self projectSelection ifNil: [^ self].
	name := UIManager default request: 'Remote name'.
	name ifEmpty: [^ self].
	url := UIManager default request: 'Remote URL' initialAnswer: 'https://github.com/<user>/<project>.git'.
	url ifEmpty: [^ self].
	self projectSelection repository gitRepository addRemote: name url: url