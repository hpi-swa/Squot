self-updating
installScriptForVersion: aString
	^ 'Metacello new
			baseline: {1};
			repository: {2};
			get; load.'
		format: {
			self projectName storeString.
			(self metacelloRepositorySpecForVersion: aString) storeString}