verifying
verifyIndexEntries
	"see 'index-format.txt' in the docs and the manpage for 'lstat'"
	| fields blob |
	fields := index entries first.
	self assert: (Date year: 2012 month: 9 day: 30) equals: fields ctime asDate.
	self assert: 0 equals: fields ctime nanoSecond.
	
	self assert: (Date year: 2012 month: 9 day: 30) equals: fields mtime asDate.
	self assert: 0 equals: fields mtime nanoSecond.
	
	"major and minor device number"
	self assert: #[1 0 0 4] asInteger equals: fields device.
	self assert: 17063798 equals: fields inode.
	self verifyMode: fields mode.
	self assert: 501 equals: fields uid.
	self assert: 20 equals: fields gid.
	self assert: 4 equals: fields size.
	
	"new line terminated string 'baz'"
	blob := GitBlob bytes: #[98 97 122 10] in: nil.
	self 
		assert: #[118 1 128 114 224 156 93 49 200 198 227 17 59 138 160 254 98 81 149 202]
		equals: blob hash asByteHash.
	
	self verifyFlags: fields flags.
	self assert: 'bar.txt' equals: fields pathString.