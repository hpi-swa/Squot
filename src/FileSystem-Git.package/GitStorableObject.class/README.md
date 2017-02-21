I am an abstract class defining common messages to which all object (in git speak) respond that can actually be stored, i.e. commits, trees, tags, blobs.

Instance Variables:
	signature	<GitObjectSignature>
		Lazily loaded signature of the object. See class comment for GitObjectSignature.