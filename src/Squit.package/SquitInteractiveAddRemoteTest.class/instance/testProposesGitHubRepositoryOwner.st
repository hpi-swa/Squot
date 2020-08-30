tests
testProposesGitHubRepositoryOwner
	| oldClipboardText proposedUrl |
	"given that a remote already exists"
	repository fsgitRepository
		addRemote: 'origin'
		url: 'https://somewhere-over-the-rainbow.com/git'.
	"when"
	proposedUrl := 'https://github.com/hpi-swa/Squot.git'.
	oldClipboardText := Clipboard clipboardText.
	[Clipboard clipboardText: proposedUrl.
	operation initializeQuery.
	"then"
	self assert: 'hpi-swa' equals: operation query remoteName
	"eventually"
	] ensure:
		[Clipboard clipboardText = proposedUrl ifTrue:
			[Clipboard clipboardText: oldClipboardText]]