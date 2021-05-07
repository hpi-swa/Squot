user interface
chooseMultipleFrom: labelsCollection values: valuesCollection title: aString
	^ self runInUiProcess: [UIManager default chooseMultipleFrom: labelsCollection values: valuesCollection title: aString]