actions
actionFeedback
	| username |
	self withUnitOfWork:
		[username := self detectGitHubUsernameIfNone: []].
	^ username
		ifNil: [SquitFeedback open]
		ifNotNil: [SquitFeedback openWithAuthor: '@', username].