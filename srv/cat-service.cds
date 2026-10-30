using {EquipmentBooking as db} from '../db/schema';


service EquipmentService {

    entity Categories as projection on db.Categories;
    entity Machinery  as projection on db.Machinery;
    entity JobSites   as projection on db.JobSites;
    entity Bookings   as projection on db.Bookings;
    
}
