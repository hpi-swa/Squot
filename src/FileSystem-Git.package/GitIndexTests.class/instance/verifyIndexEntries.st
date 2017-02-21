verifying
verifyIndexEntries
	"see 'index-format.txt' in the docs and the manpage for 'lstat'"
	| fields date mode blob padding message hash index |
	self readEntryInto: (fields := Dictionary new).
	date := (DateAndTime fromUnixTime: (fields at: #metadataSeconds) asInteger) asDate.
	self assert: (Date year: 2012 month: 9 day: 30) equals: date.
	self assert: 0 equals: (fields at: #metadataNanos) asInteger.
	
	date := (DateAndTime fromUnixTime: (fields at: #dataSeconds) asInteger) asDate.
	self assert: (Date year: 2012 month: 9 day: 30) equals: date.
	self assert: 0 equals: (fields at: #dataNanos) asInteger.
	
	"major and minor device number"
	self assert: #[1 0 0 4] equals: (fields at: #deviceID).
	self assert: 17063798 equals: (fields at: #inodeNumber) asInteger.
	self verifyMode: (fields at: #mode).
	self assert: 501 equals: (fields at: #uid) asInteger.
	self assert: 20 equals: (fields at: #gid) asInteger.
	self assert: 4 equals: (fields at: #size) asInteger.
	
	"new line terminated string 'baz'"
	blob := GitBlob bytes: #[98 97 122 10] in: nil.
	self 
		assert: #[118 1 128 114 224 156 93 49 200 198 227 17 59 138 160 254 98 81 149 202]
		equals: blob hash asByteHash.
	
	self verifyFlags: (fields at: #flags).
	self assert: 'bar.txt' equals: (fields at: #name) asString.
	
	padding := indexReader peek.
	padding := (indexReader next: 2) copyWith: padding.
	self assert: 0 equals: padding asInteger.
	
	index := indexReader contents.
	hash := GitHash from: (index copyFrom: 1to: index size - 20).
	
	self 
		assert: #[86 73 59 98 117 203 165 21 53 169 25 125 112 216 55 29 186 138 23 224]
		equals: hash byteHash