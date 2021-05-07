user interface
upstreamMergeMessage
	^ 'Merge branch ''', (repository historianNamed: self upstreamHistorianName) shortName,
			''' of ', self upstreamRemote url