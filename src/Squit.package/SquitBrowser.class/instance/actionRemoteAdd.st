actions on working copies
actionRemoteAdd
	| workingCopy name url gitRepository isHttp |
	workingCopy := self projectSelection ifNil: [^ self].
	name := UIManager default request: 'Remote name'.
	name ifEmpty: [^ self].
	url := UIManager default request: 'Remote URL' initialAnswer: 'https://github.com/<user>/<project>.git'.
	url ifEmpty: [^ self].
	(isHttp := url beginsWith: 'http') ifFalse:
		[(UIManager default confirm: 'Only http(s) is supported at the moment, you will not be able to use this remote. Continue anyway?')
			ifFalse: [^ self]].
	gitRepository := workingCopy repository gitRepository.
	gitRepository addRemote: name url: url.
	isHttp ifTrue:
		[(UIManager default confirm: 'Do you want to fetch from remote ', name, ' now?')
			ifTrue: [gitRepository fetchFrom: name. self refresh]]