/*
 //*************************************************************************************
* Class : TripManagerCtlrTest.cls
* Created By : Rohit A, Wisdomedge Inc.
* Created Date: Feb/08/2016
* OverView : Test class Of TripManagerCtlr apex class

*************************************************************************************/
@isTest
public with sharing class TripManagerCtlrTest {
    static testMethod void saveTest() {

        PageReference pageRef = page.TripManager;              
        Test.setCurrentPage(pageRef);

        ApexPages.StandardController Ctlr ;
        TripManagerCtlr trip = new TripManagerCtlr(Ctlr);
        trip.saveRecord();

        List<SelectOption> lstTripTypes = trip.getTripTypes();
        System.assert(lstTripTypes.size()>0);

        trip.getAirTypes();
        trip.getNonStopReqTypes();
        trip.getWifiReqTypes();
        trip.getPTripTypes();
        trip.getTravelTimeTypes();

        List<SelectOption> lstCCFlightTypes = trip.getCCFlightTypes();
        System.assert(lstCCFlightTypes.size()>0);
    }
}