accessing
pruneWhenFetching
	<preference: 'Prune remote-tracking branches when fetching'
		categoryList: #('Git expert settings')
		description: 'Remove remote-tracking branches that are no longer present on the remote when fetching.'
		type: #Boolean>
	^ PruneWhenFetching ifNil: [false]