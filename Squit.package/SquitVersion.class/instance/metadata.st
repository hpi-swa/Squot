Pur version
metadata
	^ Dictionary newFromPairs:
		{#author. commit author name.
		#authorEmail. commit author email.
		#authoringTimeStamp. commit author timeStamp.
		#timestamp. commit author timeStamp.
		#committer. commit committer name.
		#committerEmail. commit committer email.
		#commitTimeStamp. commit committer timeStamp.
		#message. commit message.
		#hash. commit hexHash}