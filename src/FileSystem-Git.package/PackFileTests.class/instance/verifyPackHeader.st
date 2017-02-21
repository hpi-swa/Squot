verifying
verifyPackHeader
"see pack-format.txt in the 'technical' directory of the git doc'"
	| content |
	"4-byte signature: 'P', 'A', 'C', 'K'"
	content := packReader next: 4.
	self assert: 'PACK' equals: content asString.
	
	"4-byte version number (network byte order): 2 or 3 "
	content := packReader next: 4.
	self assert: #[0 0 0 2] equals: content.  "version 2"
	
	"4-byte number of objects contained in the pack (network byte order)"
	content := packReader next: 4.
	self assert: #[0 0 0 9] equals: content  "9 objects" 