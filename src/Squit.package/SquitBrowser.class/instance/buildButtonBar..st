toolbuilder
buildButtonBar: builder
	| buttonBar commitButton pullButton pushButton fetchButton branchButton mergeButton settingsButton feedbackButton |
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
		
	fetchButton := builder pluggableActionButtonSpec new.
	fetchButton
		model: self;
		label: 'Fetch';
		enabled: #hasProjectSelection;
		action: #actionFetch;
		help: 'Fetch commits from remotes.'.

	branchButton := builder pluggableActionButtonSpec new.
	branchButton
		model: self;
		label: 'Branch';
		enabled: #hasBranchSelection;
		action: #actionBranch;
		help: 'Create a new branch.'.

	mergeButton := builder pluggableActionButtonSpec new.
	mergeButton
		model: self;
		label: 'Merge';
		enabled: #hasCommitSelection;
		action: #actionMerge;
		help: 'Merge another branch into your current one. Available soon...'.

	settingsButton := builder pluggableActionButtonSpec new.
	settingsButton
		model: self;
		label: 'Settings';
		action: #actionSettings;
		help: 'Edit your global Git settings.'.

	feedbackButton := builder pluggableActionButtonSpec new.
	feedbackButton
		model: self;
		label: 'Feedback';
		action: #actionFeedback;
		help: 'Send feedback to the tool maintainers.'.

	buttonBar children addAll: {
		commitButton. pullButton. pushButton. fetchButton. branchButton. mergeButton.
		builder pluggableSpacerSpec new.
		settingsButton. feedbackButton}.
	^ buttonBar