private
computeDifferences
	self displayProgress: 'Diffing objects... ' during:
		[self computeDiffsFromLeftToRight;
			computeDiffsForNewArtifacts;
			updateLoadOrder].