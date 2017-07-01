actions
detectGitHubRemote: aBlock ifNone: noneBlock
	| gitRepository remoteName repository |
	self hasProjectSelection ifFalse: [^ noneBlock value].
	repository := self projectSelection repository.
	gitRepository := repository gitRepository.
	remoteName := gitRepository remoteNames
		detect: [:each |
			((gitRepository remoteUrl: each) includesSubstring: 'github.com')
			and: [aBlock value: each]]
		ifNone: [^ noneBlock value].
	^ remoteName