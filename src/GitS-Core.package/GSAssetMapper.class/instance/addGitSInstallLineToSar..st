sar
addGitSInstallLineToSar: aSarBuilder
	aSarBuilder addPreambleLine:
		GSSelfUpdater installScriptForInstalledVersion
			withoutLineEndings withBlanksCondensed.