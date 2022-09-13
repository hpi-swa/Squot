actions
actionSelfUpdateSetBranch
	| selectedBranch |
	selectedBranch := SquotGUI
		request: 'Branch name for Git Browser update (master, develop, squeak5.1)' 
		initialAnswer: self class selfUpdateBranch.
	selectedBranch isEmptyOrNil ifTrue: [^ self].
	self class selfUpdateBranch: selectedBranch.
	(SquotGUI confirm: 'Would you like to install updates now?')
		ifTrue: [self class selfUpdate].