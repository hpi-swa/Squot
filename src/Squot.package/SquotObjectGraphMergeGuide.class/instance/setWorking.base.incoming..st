initialize-release
setWorking: workingGraph base: baseGraph incoming: incomingGraph
	| graphId |
	working := workingGraph.
	base := baseGraph.
	incoming := incomingGraph.
	graphId := {UUID new}.
	ids at: working put: graphId.
	ids at: base put: graphId.
	ids at: incoming put: graphId.