user interface
chooseFrom: labelsCollection values: valuesCollection title: aString
	^ self runInUiProcess: [UIManager default chooseFrom: labelsCollection values: valuesCollection title: aString]