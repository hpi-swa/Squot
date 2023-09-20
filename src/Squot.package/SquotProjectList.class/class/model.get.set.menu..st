instance creation
model: anObject get: getSelector set: setSelector menu: menuSelector
	^ self new
		model: anObject;
		getWorkingCopySelector: getSelector;
		setWorkingCopySelector: setSelector;
		menuSelector: menuSelector;
		initializeProject;
		yourself