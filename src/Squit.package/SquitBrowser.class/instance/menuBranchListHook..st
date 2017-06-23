ui menu
menuBranchListHook: aMenu
	<menuBranchList>
	| activeBranchName |
	self hasBranchSelection ifFalse: [^ aMenu].
	selectedHistorian isRemoteTrackingHistorian
		ifFalse: [aMenu addList: {
			{'Switch to this branch'. #actionBranchSwitch}
		}]
		ifTrue: [aMenu add: 'Create new branch and switch to it'
				help: 'Create a new branch at the same commit as this branch and switch to the new branch'
				action: #actionBranchCreateAndSwitch].
	activeBranchName := self projectSelection loadedHistorian shortName.
	selectedHistorian ~= self projectSelection loadedHistorian ifTrue:
		[aMenu addList: {
			{'Merge branch into ', activeBranchName. #actionBranchMerge. 'Merge this branch into your active branch ', activeBranchName}.
		}].
	selectedHistorian isRemoteTrackingHistorian
		ifFalse: [aMenu addList: {
			{'Push branch'. #actionBranchPush}.
			{'Set upstream branch of this branch'. #actionSetUpstreamBranch}
		}].
	selectedHistorian hasUpstreamHistorian ifTrue:
		[aMenu add: 'Remove upstream branch at the remote'
			help: 'Push the deletion of the remote branch'
			action: #actionBranchRemoveUpstream].
	aMenu addLine.
	selectedHistorian isRemoteTrackingHistorian
		ifFalse: [aMenu addList: {
			{'Rename branch'. #actionBranchRename}.
		}].
	aMenu addList: {
		{'Remove branch'. #actionBranchRemove}.
	}.
	^ aMenu