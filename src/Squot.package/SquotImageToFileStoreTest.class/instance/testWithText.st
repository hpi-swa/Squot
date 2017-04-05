tests
testWithText
	| text copyOfText snapshot |
	text := Text fromString: 'Original text'.
	text addAttribute: TextEmphasis italic from: 1 to: 5.
	copyOfText := text copy.
	"store"
	imageStore add: text at: 'my text'.
	snapshot := imageStore captureSnapshot.
	fileStore restoreToSnapshot: snapshot.
	"assert files"
	(fileStore directory / 'my text') exists.
	(fileStore directory / 'my text.squot-content') exists.
	"restore"
	text replaceFrom: 1 to: text size with: 'New, unsaved value'; allBold.
	imageStore restoreToSnapshot: fileStore captureSnapshot.
	self assert: copyOfText equals: text.