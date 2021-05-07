*Squot-Tools
browse
	^ (MCSnapshotBrowser forSnapshot: (MCSnapshot fromDefinitions: {self}))
		"Subclasses might want to do one or more of the following:
		categorySelection: 1;
		classSelection: 1;
		protocolSelection: 1;
		methodSelection: 1;"
		showLabelled: 'Snapshot of ', self summary