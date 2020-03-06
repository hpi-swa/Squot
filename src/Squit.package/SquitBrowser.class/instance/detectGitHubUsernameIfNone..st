private
detectGitHubUsernameIfNone: noneBlock
	self detectGitHubRemote: [:each | | url credentials |
			url := self projectSelection repository git remoteUrl: each.
			credentials := self projectSelection repository credentialsFor: url.
			credentials 	ifNotNil: [^ credentials first].
			credentials notNil]
		ifNone: [^ noneBlock value].