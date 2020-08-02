actions on branches
pullUpstream: aWorkingCopy
	[(SquitInteractivePullFromUpstream workingCopy: aWorkingCopy)
		pull]
		on: SquitUpstreamUndefined do:
			[:e |
			self inform: e historian shortName, ' has no upstream branch. Please set one, then pull again.'.
			Project current addDeferredUIMessage: [self actionSetUpstreamBranch].
			^ self].
	^ Project current addDeferredUIMessage: [self refresh; selectActiveHistorian]