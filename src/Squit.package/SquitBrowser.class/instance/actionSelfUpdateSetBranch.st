actions
actionSelfUpdateSetBranch
	self class selfUpdateBranch:
		(UIManager default
			request: 'Branch name for Git Browser update (master, develop, squeak5.1)' 
			initialAnswer: self class selfUpdateBranch).