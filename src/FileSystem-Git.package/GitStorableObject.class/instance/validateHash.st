validation
validateHash
	"Make sure the hash matches the current contents"
	self hash = (GitHash from: self byteSignature) hash
		ifFalse: [ GitInvalidObjectError signal: 'Wrong cached hash value' ].