accessing
computeChanges
	^ self changeSet gather: [:each | each changes]