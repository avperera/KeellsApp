sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'kza/zone2/test/integration/FirstJourney',
		'kza/zone2/test/integration/pages/ZoneList',
		'kza/zone2/test/integration/pages/ZoneObjectPage'
    ],
    function(JourneyRunner, opaJourney, ZoneList, ZoneObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('kza/zone2') + '/index.html'
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