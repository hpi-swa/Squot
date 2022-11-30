historians
headHistorian
	^ self historianNamed: (self git followSymbolicRefs: 'HEAD')