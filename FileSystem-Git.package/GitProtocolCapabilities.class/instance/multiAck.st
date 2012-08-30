capabilities
multiAck

	"The 'multi_ack' capability allows the server to return 'ACK obj-id
continue' as soon as it finds a commit that it can use as a common
base, between the client's wants and the client's have set.

By sending this early, the server can potentially head off the client
from walking any further down that particular branch of the client's
repository history.  The client may still need to walk down other
branches, sending have lines for those, until the server has a
complete cut across the DAG, or the client has said 'done'

Without multi_ack, a client sends have lines in --date-order until
the server has found a common base.  That means the client will send
have lines that are already known by the server to be common, because
they overlap in time with another branch that the server hasn't found
a common base on yet.

For example suppose the client has commits in caps that the server
doesn't and the server has commits in lower case that the client
doesn't, as in the following diagram:

       +---- u ---------------------- x
      /              +----- y
     /              /
    a -- b -- c -- d -- E -- F
       \
	+--- Q -- R -- S

If the client wants x,y and starts out by saying have F,S, the server
doesn't know what F,S is.  Eventually the client says 'have d' and
the server sends 'ACK d continue' to let the client know to stop
walking down that line (so don't send c-b-a), but it's not done yet,
it needs a base for x. The client keeps going with S-R-Q, until a
gets reached, at which point the server has a clear base and it all
ends.

Without multi_ack the client would have sent that c-b-a chain anyway,
interleaved with S-R-Q."
	
	^ self enable: #'multi_ack'