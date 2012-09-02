public-accessing-references
updateRef: refPath to: hexHash
"Updates the file denoted by refPath to reference the object with the sha1 name in aGitObjectSignature.
If the file denoted by refPath does not yet exist it will be created."

	self basicUpdateRef: refPath to: hexHash