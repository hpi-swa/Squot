actions
actionRemoteAdd
	| name url gitRepository |
	self projectSelection ifNil: [^ self].
	name := UIManager default request: 'Remote name'.
	name ifEmpty: [^ self].
	url := UIManager default request: 'Remote URL' initialAnswer: 'https://github.com/<user>/<project>.git'.
	url ifEmpty: [^ self].
	(url beginsWith: 'http') ifFalse:
		[(UIManager default confirm: 'Only http(s) is supported at the moment, you will not be able to use this remote. Continue anyway?')
			ifFalse: [^ self]].
	gitRepository := self projectSelection repository gitRepository.
	gitRepository addRemote: name url: url.
	(url beginsWith: 'http') ifTrue:
		[(UIManager default confirm: 'Do you want to fetch from remote ', name, ' now?')
			ifTrue: [gitRepository fetchFrom: name. self refresh]]