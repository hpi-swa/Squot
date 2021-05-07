actions
actionSelfUpdateSetBranch
	self class selfUpdateBranch:
		(SquotGUI
			request: 'Branch name for Git Browser update (master, develop, squeak5.1)' 
			initialAnswer: self class selfUpdateBranch).