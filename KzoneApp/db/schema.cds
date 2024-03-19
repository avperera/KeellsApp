using { cuid } from '@sap/cds/common';
 
namespace sap.capire.KzoneApp;
 
entity Zone: cuid
{
    
    Name : String(100) not null;
    Description : String;
    ValidityPeriod : DateTime;
    zonecategory : Composition of  many ZoneCategory on zonecategory.zone = $self;
    type : Association to   one ZoneType;
    zoneoutlet : Composition of  many ZoneOutlet on zoneoutlet.zone = $self;
    outlets             : Association to many Outlet on outlets.zone = $self;
     //outletcategories : Composition of one OutletCategory on outletcategories.zone = $self;
}
    

 
entity ZoneType : cuid
{
    
    ZoneType : String(3) not null;
}
 
entity ZoneCategory : cuid
{
    zone : Association to one Zone;
    productCategory : Association to one ProductCategory;
    outlet : Association to one Outlet;
}
 
entity ProductCategory : cuid
{
    Name : String(100) not null;
    Details : String;
   /// zoutlet : Association to many ZoneOutlet;
    //outletcategories : Composition of many OutletCategory on outletcategories.productCategory = $self;
    zonecategory : Composition of  many ZoneCategory on zonecategory.productCategory = $self;
}
 
entity ZoneOutlet : cuid
{
    zone : Association to one Zone;
    outlet : Association to one Outlet;
    //productCategory : Association to many ProductCategory;
}
 
entity Outlet : cuid
{
    Name : String(100) not null;
    Location : String(100);
    //zonecategory : Composition of many ZoneCategory on zonecategory.outlet = $self;
    //outletcategories : Composition of many OutletCategory on outletcategories.outlets = $self;
    zoneoutlet : Composition of many ZoneOutlet on zoneoutlet.outlet = $self;
    zone : Association to one Zone;
}

// ... existing code ...

entity OutletCategory {
    key ID : UUID;
    outlet : Association to one Outlet;
    productCategory : Association to one ProductCategory;
}