snapshot
buildSnapshot
	^ SquotSnapshot new
		artifacts: artifacts;
		loadOrder: loadOrder asArray;
		yourself