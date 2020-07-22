actions on branches
actionBranchPush
	SquitToggles asyncActions ifTrue:
		[^ [self withUnitOfWork:
			[self pushBranch]] fork].
	self withUnitOfWork:
	[self pushSelectedHistorianByDoing:
		[:gitRepository | | historian |
		historian := selectedHistorian.
		self checkTrackedBranchOrOfferChange: historian ifUnsupported: [^ self].
		historian repository
			exportToUpstream: historian
			ifNone: [
				self offerToSetUpstreamBranchOf: historian
					ifCanceled: [^ self].
				^ self actionBranchPush "try again"]]].