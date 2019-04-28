actions
pullOther

	"self otherWorkingCopy repository importFromUpstream: 'origin'."
	[self browser 
		projectSelection: self otherWorkingCopy;
		branchSelection: self branchName;
		actionPull.] on: SquotSelectionOfChangesRequested do: [:e | e resume: e patch "select all"]