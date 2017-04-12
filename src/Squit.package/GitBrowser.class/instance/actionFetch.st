actions
actionFetch
	| gitRepository |
	gitRepository := self projectSelection repository gitRepository.
	gitRepository fetchFromAll: gitRepository remoteNames.