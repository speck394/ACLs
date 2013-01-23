firewall {
    family inet {
        /* 11-9-2012-update */
        filter TEST {
            term 1 {
                from {
                    source-address {
                        172.16.109.1/32;
                    }
                    destination-address {
                        172.16.109.100/32;
                    }
                    protocol tcp;
                    port ssh;
                }
                then accept;
            }
            term OSPF {
                from {
                    protocol ospf;
                }
                then accept;
            }                           
            term ICMP {
                from {
                    protocol icmp;
                    icmp-type [ echo-reply echo-request ];
                }
                then accept;
            }
        }
    }
}
