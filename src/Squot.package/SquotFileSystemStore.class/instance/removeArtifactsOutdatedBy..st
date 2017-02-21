private
removeArtifactsOutdatedBy: aSnapshot
	self flag: 'TODO: create a way to keep unchanged artifacts'.
	self artifactReferencesDo: [:each | each delete"All?"].