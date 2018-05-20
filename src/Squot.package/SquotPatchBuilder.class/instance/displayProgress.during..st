public
displayProgress: progressText during: aBlock
	| progress progressStep |
	progressText displaySequentialProgress:
	[progress := 0.
	progressStep := 1 / (1 max: leftArtifacts size + (rightArtifacts keys copyWithoutAll: leftArtifacts keys) size).
	^ aBlock
		on: ProgressNotification
		do: [:n | n messageText: (progress := progress + progressStep);
				pass]].