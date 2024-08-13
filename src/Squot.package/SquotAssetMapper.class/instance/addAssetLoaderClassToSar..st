sar
addAssetLoaderClassToSar: aSarBuilder
	aSarBuilder addPreambleLine:
		'Metacello new
			baseline: ''Squot'';
			repository: ''github://hpi-swa/Squot:mapper/src'';
			get; load.'
			withoutLineEndings withBlanksCondensed.