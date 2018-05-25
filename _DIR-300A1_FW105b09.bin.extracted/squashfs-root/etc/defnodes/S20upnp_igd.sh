#!/bin/sh
LANMAC=`xmldbc -i -g /runtime/layout/lanmac`
xmldbc -i -s /runtime/upnpdev/root:1/uuid `genuuid -s InternetGatewayDevice -m $LANMAC`
