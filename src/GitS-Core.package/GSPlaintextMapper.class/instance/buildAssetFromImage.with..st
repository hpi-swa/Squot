toolbuilder
buildAssetFromImage: aWorkingCopy with: builder
	^ builder pluggableTextSpec new
		model: (GSPlaintextImageModel
					newWithMapper: self
					workingCopy: aWorkingCopy);
		getText: #getText;
		setText: #setText:;
		yourself