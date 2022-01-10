initialization
createPasswordTextPaneFor: aSymbol 

	^ (self createTextPaneFor: aSymbol) font: (StrikeFont passwordFontSize: 12)