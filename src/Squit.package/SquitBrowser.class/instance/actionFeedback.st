actions
actionFeedback
	| username |
	self withUnitOfWork:
		[username := self detectGitHubUsernameIfNone: [^ SquitFeedback open].
		SquitFeedback openWithAuthor: '@', username].