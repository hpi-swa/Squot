user interface
chooseOptionFrom: labelsCollection values: valuesCollection title: aString
	^ self runInUiProcess: [
		(UIManager default respondsTo: #chooseOptionFrom:values:title:)
			ifTrue: [UIManager default chooseOptionFrom: labelsCollection values: valuesCollection title: aString]
			ifFalse: ["< ToolBuilder-Kernel-tpr.157" UIManager default chooseFrom: labelsCollection values: valuesCollection title: aString]]