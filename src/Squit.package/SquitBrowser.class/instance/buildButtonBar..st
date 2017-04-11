toolbuilder
buildButtonBar: builder
	| buttonBar commitButton pullButton pushButton fetchButton branchButton mergeButton settingsButton |
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
		action: #actionCommit;
		help: ''.

	pullButton := builder pluggableActionButtonSpec new.
	pullButton
		model: self;
		label: 'Pull';
		action: #actionPull;
		help: ''.

	pushButton := builder pluggableActionButtonSpec new.
	pushButton
		model: self;
		label: 'Push';
		action: #actionPush;
		help: ''.
		
	fetchButton := builder pluggableActionButtonSpec new.
	fetchButton
		model: self;
		label: 'Fetch';
		action: #actionFetch;
		help: ''.

	branchButton := builder pluggableActionButtonSpec new.
	branchButton
		model: self;
		label: 'Branch';
		action: #actionBranch;
		help: ''.

	mergeButton := builder pluggableActionButtonSpec new.
	mergeButton
		model: self;
		label: 'Merge';
		action: #actionMerge;
		help: ''.

	settingsButton := builder pluggableActionButtonSpec new.
	settingsButton
		model: self;
		label: 'Settings';
		action: #actionSettings;
		help: ''.

	buttonBar children addAll: {
		commitButton. pullButton. pushButton. fetchButton. branchButton. mergeButton.
		builder pluggableSpacerSpec new.
		settingsButton}.
	^ buttonBar