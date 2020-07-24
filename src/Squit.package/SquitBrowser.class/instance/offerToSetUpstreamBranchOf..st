actions on branches
offerToSetUpstreamBranchOf: aHistorian
	(self confirm: 'No upstream branch configured for branch ', aHistorian shortName, '. Would you like to set one?')
		ifFalse: [^ nil].
	^ self requestAndSetUpstreamBranchOf: aHistorian shortName in: aHistorian repository ifCanceled: [^ nil]