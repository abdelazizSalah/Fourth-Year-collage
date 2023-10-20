package starnetworktopology;

@license(LGPL);
//
// TODO documentation
//
network StarNetwork
{
    @display("bgb=380,236");
    parameters: 
        int N = default(4); // this should be taken from the ini. 
    submodules:
        nodes[N]: Node {
            @display("p=100,61;b=142,88,oval,grey;i=abstract/router;i2=status/green");
        }
        hub: Hub {
            @display("p=273,145;b=111,83,rect,yellow;i=abstract/accesspoint");
        }
    connections:
        for i = 0..N-1 {
            nodes[i].port++ <--> hub.port++; 
        }
}
