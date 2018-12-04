diff creation
diffModified

	self diffs addAll: 
		(self modified collect: 
			[:each | LBGitFileModification new 
				parent: self;
				path: each; 
				yourself])