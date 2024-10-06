accessing
computeChanges
	^ self changeSets gather: [:each | each changes]