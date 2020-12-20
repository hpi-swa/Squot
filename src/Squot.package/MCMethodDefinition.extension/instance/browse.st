*Squot-Tools
browse
	| browser |
	browser := MCSnapshotBrowser forSnapshot: (MCSnapshot fromDefinitions: {self}).
	browser
		categorySelection: 1;
		classSelection: 1.
	classIsMeta ifTrue: [browser switchBeClass].
	browser
		protocolSelection: 1;
		methodSelection: 1;
		showLabelled: 'Snapshot of ', self summary.
	^ browser