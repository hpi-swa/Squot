toolbuilder
buildVersionFromImage: aWorkingCopy with: builder
	^ builder pluggableTextSpec new
		model: (SquotPlaintextImageModel
					newWithMapper: self
					workingCopy: aWorkingCopy);
		getText: #getText;
		setText: #setText:;
		yourself