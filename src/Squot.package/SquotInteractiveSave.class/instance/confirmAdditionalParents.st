private
confirmAdditionalParents
	(SquotWorkingCopyHasAdditionalParents workingCopy: self workingCopy operation: self)
		signal ifNotNil: [:answer | ^ answer].
	^ SquotGUI confirm: ('Your working copy has multiple parent versions:

{1}

This is right if you initiated a merge, but did not save the merged version yet.

Do you wish to save a new version with these parent versions?
If not, please choose "No" and reset the active branch to the desired one and only parent version.' translated 
			format: {(workingCopy parentVersions collect: [:each | each asString])
						joinSeparatedBy: String cr})