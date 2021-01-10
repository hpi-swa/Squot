applying
applyTo: anObjectContainer
	^ self applyTo: anObjectContainer displayingProgress: [:each | 'Applying changes to ', each]