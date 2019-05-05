diff creation
diffAdded

	self diffs addAll: 
		(self added collect: 
			[:each | SquotFileAddition  new 
				parent: self;
				path: each; 
				yourself])