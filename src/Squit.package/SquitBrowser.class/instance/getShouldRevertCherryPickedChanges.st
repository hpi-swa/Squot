user requests
getShouldRevertCherryPickedChanges
	"User aborted a cherry-pick after already merging the changes.
	Ask whether the changes should be reverted in the working copy."
	^ UIManager default confirm: 'Revert picked changes?'