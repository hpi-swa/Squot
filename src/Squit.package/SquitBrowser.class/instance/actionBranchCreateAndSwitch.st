actions on branches
actionBranchCreateAndSwitch
	"Create a new local branch from a remote-tracking branch."
	| newHistorian |
	self hasBranchSelection ifFalse: [^ self].
	self withUnitOfWork:
	[newHistorian := self createNewBranchAt: selectedHistorian version
		initialName: (selectedHistorian remoteRef shortName ifNil: [''])
		ifCanceled: [^ self].
	newHistorian setUpstreamToBranchTrackedByRemoteTrackingBranch: selectedHistorian.
	self loadBranchList.
	selectedHistorian := newHistorian.
	self actionBranchSwitch].