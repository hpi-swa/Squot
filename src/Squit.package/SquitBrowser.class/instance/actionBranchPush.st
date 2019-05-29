actions on branches
actionBranchPush
	self pushSelectedHistorianByDoing:
		[:gitRepository |
		self checkTrackedBranchOrOfferChange: selectedHistorian ifUnsupported: [^ self].
		selectedHistorian repository
			exportToUpstream: selectedHistorian
			ifNone: [
				self offerToSetUpstreamBranchOf: selectedHistorian shortName
					in: gitRepository
					ifCanceled: [^ self].
				^ self actionBranchPush "try again"]].