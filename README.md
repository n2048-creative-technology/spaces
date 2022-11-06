# spaces
Art installation running on DWM1001, Proecssing and MaxMSP


On MacOS, create aggregate audio output to connect mulltiple blueTooth headphoness.
On windows, Install ASIO4All to allow the creation of an aggregate audioo device

Each Headphone is attacched to a DWM1001-dev set as ANCHOR.

The TAG is cononected through USB o the comoputer and is read by the Processing sketch, that convert the measurements (distancces to every anchor) into OSC messages that are interpreted by the MaxMSP patch. 


## To run: 

1 - Connect the TAG to the USB port and run the Processing Sketch. 

2 - Run the MaxPatch
