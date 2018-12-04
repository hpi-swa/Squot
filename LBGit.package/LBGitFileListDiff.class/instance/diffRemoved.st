diff creation
diffRemoved

	self diffs addAll: 
		(self removed collect: 
			[:each | LBGitFileRemoval new 
				parent: self;
				path: each; 
				yourself])