*Squot-Tools
browse
	^ (MCSnapshotBrowser forSnapshot: (MCSnapshot fromDefinitions: {self}))
		showLabelled: 'Snapshot of organization'