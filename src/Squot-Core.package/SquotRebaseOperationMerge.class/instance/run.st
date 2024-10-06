running
run
	self inform: 'Merging during rebase is currently unsupported'.
	^ self afterContinue: [self retry]