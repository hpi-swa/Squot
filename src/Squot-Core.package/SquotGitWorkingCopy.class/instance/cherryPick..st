git-operations
cherryPick: aCommit
	^ (self pendingChangeSetsForPick: aCommit)
		prefixWindowTitle: 'Cherry-pick ';
		initialMessage: aCommit message;
		commit