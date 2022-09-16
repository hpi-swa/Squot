error handling
errorPushFailed: aGitPushFailed
	| answer |
	answer := SquotGUI
		chooseOptionFrom:
			{'Retry' translated. 'Cancel' translated. 'Debug'} 
		values: #(retry cancel debug)
		title: aGitPushFailed messageText.
	answer caseOf:
		{[#retry] -> [aGitPushFailed retry].
		[#cancel] -> [^ nil].
		[#debug] -> [ToolSet handleError: aGitPushFailed].
		[nil] "Dialog closed" -> [^ nil]}.
	^ answer