ui menu
shiftedMenuBranchListHook: aMenu
	<menuBranchListShifted: true>
	| commands activeBranchName onlyActive onlyInactive onlyLocal onlyRemote onlyWithUpstream |
	self hasBranchSelection ifFalse: [^ aMenu].
	activeBranchName := self projectSelection loadedHistorian shortName.
	onlyLocal := selectedHistorian isRemoteTrackingHistorian not.
	onlyRemote := selectedHistorian isRemoteTrackingHistorian.
	onlyActive := selectedHistorian = self projectSelection loadedHistorian.
	onlyInactive := selectedHistorian ~= self projectSelection loadedHistorian.
	onlyWithUpstream := selectedHistorian hasUpstreamHistorian.
	commands :=
		{{'Make this the current branch'. #actionBranchSetCurrent. 'Assume from now on that any uncommitted changes were made against this branch. Use with caution, usually you rather want to properly switch to a branch, which loads any changes from it into memory.'. onlyLocal & onlyInactive}}.
	
	self buildMenu: aMenu from: commands.
	"add all the usual menu items as well"
	self menuBranchListHook: aMenu.
	^ aMenu