actions
actionSetUpstreamBranch
	self hasBranchSelection ifFalse: [^ self].
	[ | localBranchName localHistorian newRemote |
	newRemote := nil.
	self withUnitOfWork:
	[localHistorian := selectedHistorian.
	localBranchName := localHistorian shortName.
	[self requestAndSetUpstreamBranchOf: localBranchName
		in: localHistorian repository
		ifCanceled:
			[newRemote ifNotNil:
				[(self confirm: 'Keep new remote ', newRemote, '?') ifFalse:
					[localHistorian git removeRemoteNamed: newRemote]]]]
		on: SquitNoRemotes do:
			[:noRemotes |
			newRemote := self offerToAddRemoteTo: localHistorian repository.
			newRemote
				ifNil: [noRemotes return]
				ifNotNil: [noRemotes resume: newRemote]]]]
		fork.