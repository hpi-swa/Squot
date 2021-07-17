toolbuilder
buildButtonBar: builder
	| buttonBar commitButton pullButton pushButton |
	buttonBar := builder pluggablePanelSpec new
		layout: #horizontal;
		"spacing: -1;"
		children: OrderedCollection new;
		frame: (LayoutFrame new leftFraction: 0 offset: 0;
					 topFraction: 0.6 offset: -25;
					 rightFraction: 1 offset: 0;
					 bottomFraction: 0.6 offset: 0)
		yourself.

	commitButton := builder pluggableActionButtonSpec new.
	commitButton
		model: self;
		label: 'Commit';
		enabled: #hasProjectSelection;
		action: #actionCommit;
		help: 'Commit your current changes.'.

	pullButton := builder pluggableActionButtonSpec new.
	pullButton
		model: self;
		label: 'Pull';
		enabled: #hasBranchSelection;
		action: #actionPull;
		help: 'Pull commits into the active branch from its tracked remote branch.'.

	pushButton := builder pluggableActionButtonSpec new.
	pushButton
		model: self;
		label: 'Push';
		enabled: #hasBranchSelection;
		action: #actionPush;
		help: 'Push commits to a remote.'.
		
	buttonBar children addAll: {
		commitButton. pushButton. pullButton}.
	^ buttonBar