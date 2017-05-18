Pur version
metadata
	"Proposed set of common attribute names, if provided by the backend:
	#(author email timestamp message committer).
	#email may also be a part of #author, then #email should be absent
	#timestamp may either be the instant of authoring the version or the instant of creation
	More attributes can be added if the backend provides more."
	^ Dictionary newFromPairs:
		{#author. commit author name.
		#authorEmail. commit author email.
		#email. commit author email.
		#authoringTimestamp. commit author timeStamp.
		#timestamp. commit author timeStamp.
		#committer. commit committer name.
		#committerEmail. commit committer email.
		#commitTimestamp. commit committer timeStamp.
		#message. commit message.
		#hash. commit hexHash}