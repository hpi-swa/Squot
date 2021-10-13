actions
actionPush

	self withUnitOfWork: [
		| historian |
		historian := self selectedRepository loadedHistorian.
		[[(SquitInteractivePushToUpstream historian: historian) push]
			on: SquitBadRemote do:
				[:e |
				Project current addDeferredUIMessage: [self error: 'bad remote: ' , e remote].
				e resume]]
			on: SquotCannotExportEmptyHistory do:
				[self inform: 'No commits to push on ', historian shortName, ' yet.'].].