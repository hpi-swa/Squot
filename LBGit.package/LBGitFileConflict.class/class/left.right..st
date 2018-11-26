as yet unclassified
left: leftFileDiff right: rightFileDiff

	^ self new
		leftChange: leftFileDiff;
		rightChange: rightFileDiff;
		yourself