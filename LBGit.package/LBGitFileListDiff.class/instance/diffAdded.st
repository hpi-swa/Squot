diff creation
diffAdded

	self diffs addAll: 
		(self added collect: 
			[:each | LBGitFileAddition  new 
				parent: self;
				path: each; 
				yourself])