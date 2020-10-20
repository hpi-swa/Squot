Holds the state of the merge of three load orders. Their resolution also depends on the resolution of container conflicts in the overall object container merge.

Load order is a simplification of dependencies among artifacts. The order #(a b c) implies: a must be loaded before b, b must be loaded before c (regardless of whether that is actually required or not). The actual dependencies are always a subset of the predecessor-successor relations among the pairs of artifacts. That each artifact appears only once in the order corresponds with two artifacts not being able to mutually depend on each other. Since not to change something is typically not considered worth preserving during a merge, only new predecessor-successor relations must be preserved during a merge. Moreover it makes sense to keep relations that are present on both sides.

If (c b a) is merged with (a c b) based on (a b c): there are new relations (c a), (c b), (b a) and confirmed relation (c b) (but we already had this).
The merge solution is (c b a), as a topological order of the graph formed by the relations.

Conflicts arise if there are cycles in the graph formed by the new and confirmed relations.

If (x a b) is merged with (a b x) based on (a b): there are new relations (x a), (x b), (a x), (b x) and the confirmed relation (a b). Since these relations form a graph with cycles, there are conflicts.
There is no solution without relaxing the order constraints (= conflict resolution), which means to withdraw relations.
Solution (x a b) means to withdraw the relations (a x), (b x).
Solution (a b x) means to withdraw the relations (x a), (x b).
Solution (a x b), chosen by neither side, means to withdraw the relations (x a), (b x).
Solutions with b before a would violate the confirmed relation (a b).
If x were in fact independent of both a and b, none of the relations with x would actually matter, and either choice that still puts a before b would be correct. But this independence cannot be inferred from only two samples of total orders.

If (b a c d) is merged with (a c d b) based on (a b c d): there are new relations (b a), (c b), (d b) and confirmed relations (a c), (a d), (c d). The graph formed by these relations has cycles: (a c b a), (a d b a), (a c d b a). The chordless cycles are (a c b a) and (a d b a). (Intuitively: b cannot come both before a and after c, d.) Relations must be withdrawn to break all cycles. Removing chord edges like (c b) would leave chorded cycles intact, so at least one non-chord edge must be withdrawn. Withdrawing the relation (b a) would result in the incoming order. Withdrawing (c b) and (d b) would result in the working copy order. If the confirmed relations (a c), (a d) were in fact not needed, (c d b a) would be a possible solution.

Removing an artifact does not imply new relations, so it cannot result in cycles.

If (a b x c d e f) is merged with (a b c x d e f) based on (a b c d e f): new relations ((a,b,c) x), (x (c,d,e,f)), confirmed all induced by (a b c d e f). These are many edges in the graph. The only cycle is (c x c) though, so only (c x) or (x c) are useful candiates to be removed to resolve the conflict.

How to merge then?
1. Find relevant relations and detect whether there are conflicts.
2. If there are conflicts, let user choose whether to stick with the incoming or the current order.
3. Apply additions and removals to both sides, so both orders have the same elements.
4. Find a suitable topological ordering according to the remaining relations (see below).

Example merge without conflicts:
Original order: Squot Squit Tonel Baseline.
Working copy order: Squot Tonel Squit Baseline. (Tonel does not depend on Squit.)
Incoming order: Baseline Squot Squit Tonel. (Baseline depends on nothing.)
Acceptable solution: Baseline Squot Tonel Squit.
New relations: (Tonel Squit), (Baseline Squot), (Baseline Tonel), (Baseline Squit).
Confirmed relations: (Squot Tonel), (Squot Squit).
The relations form a directed, acyclic graph, therefore there is an automatic solution.
(True, but unknown to the model, dependency relations: (Squot Tonel), (Squot Squit). Actually, since none of the new relations is a true relation, neither the working copy changes nor the incoming changes were necessary.)

Graph algorithm both detects cycles and finds eventual order (after additions and removals have been applied). O(n²):
Initialize weighted directed graph with nodes. O(n)
Increase edges from working and incoming orders. O(n²)
	(Squot->Tonel. Squot->Squit. Squot->Baseline. Tonel->Squit. Tonel->Baseline. Squit->Baseline.
	Baseline->Squot. Baseline->Squit. Baseline->Tonel. Squot->Squit(2). Squot->Tonel(2). Squit->Tonel).
Decrease all edges implied by the original order O(n²):
	-Squot->Squit. -Squot->Tonel. -Squot->Baseline. -Squit->Tonel. -Squit->Baseline. -Tonel->Baseline.
That leaves: (Squot->Tonel(1). Squot->Squit(1). Tonel->Squit. Baseline->Squot. Baseline->Squit. Baseline->Tonel). The confirmed relations that are present in all three orders are still in the graph (here: Squot->Tonel. Squot->Squot).
If both sides agreed on a new dependency, its edge will still have weight 2 in the graph now.
The graph is always connected because the graphs derived from the input orders always are and nodes are either connected through confirmed relations or new relations.
Find a topological order using depth first search O(n²) (since number of edges is in O(n²)):
	Start with Squot (any node).
	 Visit Tonel.
	  Visit Squit. No outgoing edges from Squit, put in list.
	  (If an edge had degree 2, the edge would not need to be visited multiple times because the target node is already on the list.)
	  No more outgoing edges from Tonel, put in list.
	 Visit Squit, already in list.
	 No more outgoing edges from Squot, put in list.
	Continue with Tonel, already in list.
	Continue with Squit, already in list.
	Continue with Baseline.
	 Visit Squot, already in list.
	 Visit Squit, already in list.
	 Visit Tonel, already in list.
	 No more outgoing edges from Baseline, put in list.
List is now Squit Tonel Squot Baseline.
Reverse list. O(n)
--> Baseline Squot Tonel Squit.
If the DFS for the topological ordering would reach a node again on the same path, there would be a cycle, and therefore conflicts. Without conflicts or after resolution, the graph is acyclic and therefore a topological ordering can be found.