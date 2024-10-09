ui
warnIfImageNotClean: aBlock
	self activeWorkingCopy isImageClean ifFalse: [
		(self confirm: ({
			'You have uncommitted changes.'.
			'If you proceed, they may be lost.'.
			'You can'.
			'  a) cancel to commit your changes,'.
			'  b) proceed and lose your changes, or'.
			'  c) proceed and manually exclude those'.
			'      changes in the upcoming dialog,'.
			'      that will undo your uncommitted changes. '.
			'Do you want to proceed?'.
		} joinSeparatedBy: String cr)) ifFalse: aBlock].