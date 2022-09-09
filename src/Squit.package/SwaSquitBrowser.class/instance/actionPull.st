actions
actionPull

	[(SquitInteractivePullFromUpstream workingCopy: self selectedRepository)
		pull]
		on: SquitUpstreamUndefined do:
			[:e |
			self inform:
				'You can''t pull as this repository has no remote repository configured (e. g. on GitHub). ',
				'Please set one using the advanced Git Browser, then pull again.'.
			^ self]
		on: SquitBadRemote do:
			[:e |
			self inform:
				'Something went wrong while pulling from the remote repository. ',
				'Please try fixing the issue with the advanced Git Browser or seek help from slack.'.
			^ self].
	^ Project current addDeferredUIMessage: [self refresh]