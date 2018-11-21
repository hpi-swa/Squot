actions on branches
actionBranchCreateAndSwitch
	"Create a new local branch from a remote-tracking branch."
	| newHistorian |
	self hasBranchSelection ifFalse: [^ self].
	newHistorian := self createNewBranchAt: selectedHistorian version ifCanceled: [^ self].
	newHistorian setUpstreamToBranchTrackedByRemoteTrackingBranch: selectedHistorian.
	selectedHistorian := newHistorian.
	self actionBranchSwitch.