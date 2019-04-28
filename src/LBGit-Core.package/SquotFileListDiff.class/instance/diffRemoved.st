diff creation
diffRemoved

	self diffs addAll: 
		(self removed collect: 
			[:each | SquotFileRemoval new 
				parent: self;
				path: each; 
				yourself])