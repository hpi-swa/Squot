ui diff tree
diffKey: aChar from: view event: event

	self hasNodeSelected ifFalse: [^ false].
	event anyModifierKeyPressed ifFalse: [^ false].
	
	aChar == $x ifTrue: [
		self selectedDiffNodeIsIncluded
			ifTrue: [self deactivateSelectedNode]
			ifFalse: [self activateSelectedNode]. ^ true].
	aChar == $i ifTrue: [
		self inspectSelectedDiffContent. 
		^ true].
	aChar == $b ifTrue: [
		self browseDiffContent.
		^ true].
	
	^ false