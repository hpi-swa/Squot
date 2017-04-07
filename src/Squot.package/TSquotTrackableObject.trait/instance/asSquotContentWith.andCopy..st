Squot tracking
asSquotContentWith: aContentCapturer andCopy: copyOfSelf
	"Use aContentCapturer to answer a conserved form of me that is suitable to be stored in Snapshots. copyOfSelf should be a copy of me, or an object reached from the copy of another object via the same path as I can be reached from the copied object."
	^ aContentCapturer convert: self withItsCopy: copyOfSelf