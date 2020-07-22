actions on branches
offerToSetUpstreamBranchOf: aHistorian
	(UIManager default confirm: 'No upstream branch configured for branch ', aHistorian shortName, '. Would you like to set one?')
		ifFalse: [^ nil].
	^ self requestAndSetUpstreamBranchOf: aHistorian shortName in: aHistorian repository ifCanceled: [^ nil]