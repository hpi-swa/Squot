ref-tree
newRefTreeWithLabel: labelString ref: refString
	^ GSRefTree new
		workingCopy: self;
		label: labelString;
		ref: refString;
		yourself