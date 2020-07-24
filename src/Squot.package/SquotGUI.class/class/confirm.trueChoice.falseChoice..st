user interface
confirm: aString trueChoice: trueLabelString falseChoice: falseLabelString
	^ self runInUiProcess: [UIManager default confirm: aString trueChoice: trueLabelString falseChoice: falseLabelString]