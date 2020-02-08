I walk the history graph of versions. You may compare me to git-rev-list.

Use #startingFrom:do: to evaluate a block for each enumerated version.
In the block you can call #stop to interrupt the history walk, but the state will be preserved. You may then continue the iteration with #continueDo:, where you can supply another block.

Instance Variables
	versionList:		output list of versions
	versionBlock:	block to be evaluated for each enumerated version
	stopRequested:	<Boolean> whether the iteration should be stopped