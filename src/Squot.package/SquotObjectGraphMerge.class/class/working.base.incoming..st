instance creation
working: workingGraph base: baseGraph incoming: incomingGraph
	^ self new
		setWorking: workingGraph
		incoming: incomingGraph
		base: baseGraph;
		yourself