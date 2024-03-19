sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'kza.zone2',
            componentId: 'ZoneList',
            contextPath: '/Zone'
        },
        CustomPageDefinitions
    );
});