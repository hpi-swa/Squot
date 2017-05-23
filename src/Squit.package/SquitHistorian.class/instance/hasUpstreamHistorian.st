testing
hasUpstreamHistorian
	^ self upstreamRemoteName notNil
		and: [self upstreamHistorianName notNil]