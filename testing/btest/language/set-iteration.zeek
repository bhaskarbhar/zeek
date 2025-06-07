# @TEST-EXEC: zeek -b %INPUT >out
# @TEST-EXEC: btest-diff out
# @TEST-EXEC: btest-diff .stderr

global sset: set[string];
global ordered_sset: set[string] &ordered;
global ordered_sset2: set[string] = {
	"foo",
	"bar",
} &ordered &redef;

redef ordered_sset2 += { "baz" };

event zeek_init()
	{
	local i = 0;
	while ( ++i <= 5 )
		{
		add sset[cat(i)];
		add ordered_sset[cat(i)];
		add ordered_sset2[cat(i)];
		}

	print "sset";
	for ( s in sset )
		print s;

	print "copy(sset)";
	for ( s in copy(sset) )
		print s;

	print "ordered_sset";
	for ( s in ordered_sset )
		print s;

	print "copy(ordered_sset)";
	for ( s in copy(ordered_sset) )
		print s;

	print "ordered_sset2";
	for ( s in ordered_sset2 )
		print s;

	print "copy(ordered_sset2)";
	for ( s in copy(ordered_sset2) )
		print s;
	}
