sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'Z/zonemodule/test/integration/FirstJourney',
		'Z/zonemodule/test/integration/pages/ZoneList',
		'Z/zonemodule/test/integration/pages/ZoneObjectPage'
    ],
    function(JourneyRunner, opaJourney, ZoneList, ZoneObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('Z/zonemodule') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheZoneList: ZoneList,
					onTheZoneObjectPage: ZoneObjectPage
                }
            },
            opaJourney.run
        );
    }
);