using ProcessorService as service from '../../srv/processor-service';
using from '../../db/schema';

annotate service.Zone with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : Name,
            Label : 'Zone Name',
        },{
            $Type : 'UI.DataField',
            Value : Description,
            Label : 'Description',
        },{
            $Type : 'UI.DataField',
            Value : ValidityPeriod,
            Label : 'Zone Validity Period',
        },]
);
annotate service.Zone with {
    zoneType @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'ZoneType',
        Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : zoneType_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'type',
                },
            ],
        Label : '{i18n>Zonetype}',
    }
};
annotate service.Zone with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Name,
                Label : 'Zone Name',
            },{
                $Type : 'UI.DataField',
                Value : Description,
                Label : 'Description',
            },{
                $Type : 'UI.DataField',
                Value : ValidityPeriod,
                Label : 'Zone Validity Period',
            },
            {
                $Type : 'UI.DataField',
                Value : type_ID,
            },
           ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Zone Outlets',
            ID : 'outlets',
            Target : 'zoneoutlet/@UI.LineItem#outlets1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>ZoneCategory}',
            ID : 'ZoneCategory',
            Target : 'zonecategory/@UI.LineItem#ZoneCategory',
        },
        
    ]
);

annotate service.category with @(
    UI.LineItem #Categories : [
        {
            $Type : 'UI.DataField',
            Value : CatName,
            Label : 'Category Name',
        },{
            $Type : 'UI.DataField',
            Value : Description,
            Label : 'Description',
        },]
);



annotate service.outlet with @(
    UI.LineItem #Outlets1 : []
);
annotate service.Zone with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : Name,
        },
        TypeName : 'Keels Zone App',
        TypeNamePlural : '',
        Initials : Description,

        ImageUrl : 'data:image/png;base64,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'
    }
);


annotate service.category with {
    CategoryID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'category',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : CategoryID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'CatName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Description',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'CategoryID',
                },
            ],
            Label : 'CatID',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.category with {
    ID @Common.Text : CatName
};

annotate service.outlet with {
    ID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'outlet',
            Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : ID,
                        ValueListProperty : 'ID',
                    },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Name',
                },
                ],
            Label : 'OutletIDD',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.outlet with @(
    UI.PresentationVariant #vh_outlet_ID : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : ID,
                Descending : false,
            },
        ],
    }
);


annotate service.ZoneOutlet with {
    ID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'outlet',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Name',
                },
            ],
            Label : 'OutletID',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.ZoneType with {
    type @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ZoneType',
            Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : type,
                        ValueListProperty : 'type',
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'ID',
                    },
                ],
            Label : 'ZoneType',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Zone with {
    zoneType @Common.ValueListWithFixedValues : true
};
annotate service.Zone with {
    zoneType @Common.Text : {
            $value : zoneType.type,
            ![@UI.TextArrangement] : #TextOnly,
        }
};





annotate service.outlet with {
    Lid @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'outlet',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Lid,
                    ValueListProperty : 'Lid',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Location',
                },
            ],
            Label : 'LID',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.ZoneOutlet with @(
    UI.LineItem #Zoutlets : []
);
annotate service.outlet with {
    Lid @Common.Text : {
        $value : Name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.ZoneOutlet with {
    Lid @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ZoneOutlet',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Lid_ID,
                    ValueListProperty : 'Lid_ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Lid/Name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.ZoneOutlet with @(
    UI.LineItem #outlets : [
    ]
);
annotate service.ZoneOutlet with @(
    UI.LineItem #zoutletsa : [
    ]
);

annotate service.ZoneType with {
    typeID @Common.Text : {
        $value : ZoneType,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.ZoneOutlet with @(
    UI.LineItem #outlets1 : [
        {
            $Type : 'UI.DataField',
            Value : outlet_ID,
            Label : 'Outlet Name',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : outlet.Location,
            Label : 'Location',
        },
     
        ]
);
annotate service.ZoneOutlet with {
    outlet @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Outlet',
            Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : outlet_ID,
                        ValueListProperty : 'ID',
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'Name',
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'Location',
                    },
                ],
            Label : 'OutletID',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.ZoneOutlet with {
    zone @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Outlet',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : zone_ID,
                    ValueListProperty : 'zone_ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Location',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.ZoneOutlet with @(
    UI.PresentationVariant #outlets1 : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.LineItem#outlets1',
        ],
    }
);

annotate service.ZoneOutlet with {
    outlet @Common.FieldControl : #Mandatory
};
annotate service.ZoneCategory with @(
    UI.LineItem #ZoneCategory : [
        {
            $Type : 'UI.DataField',
            Value : productCategory_ID,
            Label : 'Category Name',
            ![@UI.Importance] : #High,
        },{
            $Type : 'UI.DataField',
            Value : productCategory.Name,
            Label : 'Name',
            ![@UI.Hidden],
        },{
            $Type : 'UI.DataField',
            Value : productCategory.Details,
            Label : 'Category Details',
        },]
);
annotate service.ZoneCategory with {
    productCategory @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ProductCategory',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : productCategory_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Details',
                },
            ],
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.ZoneType with {
    typeID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Zone',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : typeID,
                    ValueListProperty : 'type_typeID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Name',
                },
            ],
        },
        Common.ValueListWithFixedValues : false
)};


annotate service.ZoneType with {
    ZoneType @Common.Label : 'Zone Type '
};


annotate service.Zone with {
    Name @Common.Label : 'Zone Name'
};
annotate service.Zone with {
    type @Common.Label : 'Zone Type'
};
annotate service.Zone with @(
    UI.SelectionPresentationVariant #tableView2 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View 2',
    },
    UI.LineItem #tableView1 : [
    ],
    UI.SelectionPresentationVariant #tableView3 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView1',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View 3',
    }
);
annotate service.ZoneCategory with {
    productCategory @Common.FieldControl : #Mandatory
};
annotate service.Zone with {
    type @Common.FieldControl : #Mandatory
};
annotate service.Zone with {
    Name @Common.FieldControl : #Mandatory
};
annotate service.Outlet with {
    zone @Common.Text : {
        $value : Name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};


annotate service.ZoneType with {
    ZoneType @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ZoneType',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ZoneType,
                    ValueListProperty : 'ZoneType',
                },
            ],
        Label : 'ZoneType',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Zone with @(
    UI.SelectionFields : [
        Name,
        type.ZoneType,
    ]
);
annotate service.ZoneType with {
    ID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ZoneType',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'ZoneType',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Zone with {
    type @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ZoneType',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : type_ID,
                    ValueListProperty : 'ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.ZoneType with {
    ID @Common.Text : {
        $value : ZoneType,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.Zone with {
    type @Common.Text : {
        $value : type.ZoneType,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.ZoneOutlet with {
    outlet @Common.Text : {
            $value : outlet.Name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.ZoneCategory with {
    productCategory @Common.Text : {
            $value : productCategory.Name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.ZoneType with @(
    UI.DataPoint #ZoneType : {
        $Type : 'UI.DataPointType',
        Value : ZoneType,
        Title : 'ZoneType',
    }
);
annotate service.Zone with @(
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ZoneType',
            Target : 'type/@UI.DataPoint#ZoneType',
        },
    ]
);
annotate service.Zone with @(
    UI.Identification : []
);
annotate service.ZoneCategory with @(
    UI.PresentationVariant #ZoneCategory : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.LineItem#ZoneCategory',
        ],
        GroupBy : [
            productCategory_ID,
        ],
    }
);
annotate service.OutletCategory with @(
    UI.LineItem #outletscat : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },{
            $Type : 'UI.DataField',
            Value : outlets.Name,
            Label : 'Name',
        },]
);
annotate service.OutletCategory with {
    ID @Common.Text : {
            $value : productCategory.Name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.OutletCategory with {
    productCategory @Common.Text : {
            $value : productCategory.Name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.ZoneCategory with @(
    UI.LineItem #Categories : [
        {
            $Type : 'UI.DataField',
            Value : productCategory_ID,
            Label : 'productCategory_ID',
        },{
            $Type : 'UI.DataField',
            Value : productCategory.Name,
            Label : 'Name',
        },
        {
            $Type : 'UI.DataField',
            Value : productCategory.outletcategories.ID,
            Label : 'ID',
        },]
);
annotate service.ZoneCategory with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'all Categories ',
            ID : 'allCategories',
            Target : 'productCategory/@UI.LineItem#allCategories',
        },]
);
annotate service.ProductCategory with @(
    UI.LineItem #allCategories : [
        {
            $Type : 'UI.DataField',
            Value : Name,
            Label : 'Name',
        },{
            $Type : 'UI.DataField',
            Value : Details,
            Label : 'Details',
        },
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },]
);
annotate service.ProductCategory with {
    ID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ProductCategory',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Name',
                },
            ],
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.ZoneCategory with @(
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'kk',
            ID : 'kk',
            Target : '@UI.FieldGroup#kk',
        },
    ],
    UI.FieldGroup #kk : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : productCategory_ID,
                Label : 'productCategory_ID',
            },{
                $Type : 'UI.DataField',
                Value : outlet.Name,
                Label : 'Name',
            },{
                $Type : 'UI.DataField',
                Value : outlet.Location,
                Label : 'Location',
            },],
    }
);
annotate service.ZoneOutlet with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Categories ',
            ID : 'Categories',
            Target : 'productCategory/@UI.LineItem#Categories',
        },
    ]
);
annotate service.ProductCategory with @(
    UI.LineItem #Categories : [
        {
            $Type : 'UI.DataField',
            Value : Name,
            Label : 'Name',
        },{
            $Type : 'UI.DataField',
            Value : Details,
            Label : 'Details',
        },{
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },]
);
annotate service.ZoneOutlet with @(
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'outlets',
            ID : 'outlets',
            Target : '@UI.FieldGroup#outlets',
        },
    ],
    UI.FieldGroup #outlets : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : outlet.Name,
                Label : 'Name',
            },{
                $Type : 'UI.DataField',
                Value : outlet.Location,
                Label : 'Location',
            },],
    }
);
annotate service.ZoneCategory with @(
    UI.LineItem #Oc : [
    ]
);
