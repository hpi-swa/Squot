I walk the history graph of versions. You may compare me to git-rev-list.

Use #startingFrom:do: to evaluate a block for each enumerated version.
In the block you can call #stop to interrupt the history walk, but the state will be preserved. You may then continue the iteration with #continueDo:, where you can supply another block.

Instance Variables
	searchFrontier:		collection of pending versions to visit
	seen:		already visited versions
	sinkVersions:		versions whose parents shall not be inspected further
	sourceVersions:		versions from which the search starts
	versionList:		output list of versions
	versionBlock:	block to be evaluated for each enumerated version
	stopRequested:	<Boolean> whether the iteration should be stopped