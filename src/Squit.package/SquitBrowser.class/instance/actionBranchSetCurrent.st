actions on branches
actionBranchSetCurrent
	"Force the selected branch to be the loaded one, without really loading anything."
	self hasProjectSelection ifFalse: [^ self].
	self hasBranchSelection ifFalse: [^ self].
	self projectSelection loadedHistorian: selectedHistorian.
	self activeBranchChanged.