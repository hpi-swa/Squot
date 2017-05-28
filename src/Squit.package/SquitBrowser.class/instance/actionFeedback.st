actions
actionFeedback
	| username |
	username := self detectGitHubUsernameIfNone: [^ SquitFeedback open].
	SquitFeedback openWithAuthor: '@', username