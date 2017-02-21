as yet unclassified
versionInfoFromFileNamed: aString 
	| tag tagName |
	tagName := aString allButLast: 4. "strip .git"
	tag := self repository tagNamed: tagName.
	^ MCGitVersionInfo filesystem: tag commit: tag store revision