package wireless_network_sim.src;

import inet.node.inet.StandardHost;
import inet.applications.udpapp.UdpBasicApp;
import inet.linklayer.ieee80211.Ieee80211Interface;
import inet.mobility.contract.IMobility;

module WirelessHost extends StandardHost
{
    parameters:
        @display("i=device/laptop");
        
        // Wireless interface
        wlan[*].typename = "Ieee80211Interface";
        wlan[*].radio.typename = "Ieee80211ScalarRadio";
        wlan[*].mac.typename = "Ieee80211Mac";
        wlan[*].mgmt.typename = "Ieee80211MgmtSta";
        
        // Mobility module
        mobilityType = "StationaryMobility";
        
        // Application
        numApps = 1;
        app[0].typename = "UdpBasicApp";
        
    submodules:
        // Mobility is inherited from StandardHost
    
    connections allowunconnected:
}
