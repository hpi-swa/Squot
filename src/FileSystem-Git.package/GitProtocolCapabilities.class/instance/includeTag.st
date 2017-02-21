capabilities
includeTag

	"The 'include-tag' capability is about sending annotated tags if we are
sending objects they point to.  If we pack an object to the client, and
a tag object points exactly at that object, we pack the tag object too.
In general this allows a client to get all new annotated tags when it
fetches a branch, in a single network connection.

Clients MAY always send include-tag, hardcoding it into a request when
the server advertises this capability. The decision for a client to
request include-tag only has to do with the client's desires for tag
data, whether or not a server had advertised objects in the
refs/tags/* namespace.

Servers MUST pack the tags if their referrant is packed and the client
has requested include-tags.

Clients MUST be prepared for the case where a server has ignored
include-tag and has not actually sent tags in the pack.  In such
cases the client SHOULD issue a subsequent fetch to acquire the tags
that include-tag would have otherwise given the client.

The server SHOULD send include-tag, if it supports it, regardless
of whether or not there are tags available."

	^ self enable: #'include-tag'
