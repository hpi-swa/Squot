diff creation
diffModified

	self diffs addAll: 
		(self modified collect: 
			[:each | SquotFileModification new 
				parent: self;
				path: each; 
				yourself])