using { sap.capire.KzoneApp as my } from '../db/schema';
 
 
 
service ProcessorService {
   
    @odata.draft.enabled
    entity Zone as projection on my.Zone;
    entity ZoneCategory as projection on my.ZoneCategory;
    entity ZoneOutlet as projection on my.ZoneOutlet;
    entity OutletCategory as projection on my.OutletCategory;
    entity Outlet as projection on my.Outlet;
    entity ProductCategory as projection on my.ProductCategory;
    entity ZoneType as projection on my.ZoneType;
    



    action addAllCategoriesToAllOutlets();

}
 
//annotate ProcessorService.Zone with @odata.draft.enabled;