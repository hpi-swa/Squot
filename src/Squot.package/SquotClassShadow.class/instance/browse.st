*Squot-Tools
browse
	snapshot definitions isEmpty ifTrue: [^ self inform: 'Class does not exist'].
	^ (MCSnapshotBrowser forSnapshot: snapshot)
		categorySelection: 1;
		classSelection: 1;
		showLabelled: 'Snapshot of ', self className