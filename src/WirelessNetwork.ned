package wireless_network_sim.src;

import inet.node.inet.StandardHost;
import inet.node.wireless.AccessPoint;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;
import inet.environment.common.PhysicalEnvironment;

network WirelessNetwork {
    parameters:
        int numHosts = default(10);
        double playgroundSizeX = default(400m);
        double playgroundSizeY = default(400m);

    submodules:
        visualizer: IntegratedCanvasVisualizer {
            parameters: @display("p=580,25");
        }

        physicalEnvironment: PhysicalEnvironment {
            parameters: @display("p=680,25");
        }

        radioMedium: Ieee80211ScalarRadioMedium {
            parameters: @display("p=780,25");
        }

        accessPoint: AccessPoint {
            parameters: @display("p=200,50;i=device/accesspoint");
            wlan[*].mgmt.typename = "Ieee80211MgmtApSimplified";
            wlan[*].agent.typename = "";
        }

        host[numHosts]: StandardHost {
            parameters: @display("p=100+i*30,200+i*30;i=device/laptop");
            wlan[*].mgmt.typename = "Ieee80211MgmtSta";
            wlan[*].agent.typename = "Ieee80211AgentSta";
        }
    
    connections allowunconnected: 
}