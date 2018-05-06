I am a tool that allows the user to pick changes to manipulate a SquotPatch.

To allow for clean canceling, the artifactDiffs are not changed immediately when the SquotDiffNodes displayed herein are manipulated.
Only after the changes are #accepted, the #selectedPatch will contain the adjusted diffs.

Instance Variables
	canceled:		<Boolean>
	controllerForIgnores:		<Object> delegate for ignore state modifications
	ignored:		<Dictionary> ignored artifacts
	artifactDiffs:	<Dictionary> the artifact differences from the patch to be manipulated
	rootNodes:		<SequenceableCollection> list of tree roots of SquotDiffNode trees
	selectedNode:		<SquotDiffNode> the currently selected node