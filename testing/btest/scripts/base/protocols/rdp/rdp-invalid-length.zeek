# Tests a pcap that has a known-invalid length in a RDP_Negotiation_Response
# header, ensuring that it throws a binpac exception and reports a notice to
# analyzer.log. The pcap used is a snippet of a pcap from OSS-Fuzz #57109.

# @TEST-EXEC: zeek -b -r $TRACES/rdp/rdp-invalid-length.pcap %INPUT
# @TEST-EXEC: btest-diff analyzer_debug.log

@load frameworks/analyzer/debug-logging.zeek
@load base/protocols/rdp
