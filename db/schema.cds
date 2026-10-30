namespace EquipmentBooking;

using {cuid,managed} from '@sap/cds/common';

entity Categories : cuid {

    name        : String(50);
    description : String(200);
    machines    : Association to many Machinery
                      on machines.category = $self;
}

// Heavy Machinery Assets
entity Machinery : cuid,managed {

    assetCode : String(30);
    name      : String(100);
    brand     : String(100);
    modelYear : Integer;
    dailyRate : Decimal(9, 2);
    status    : String(20) default 'AVAILABLE';

    category  : Association to Categories;
    booking   : Association to many Bookings
                    on booking.machine = $self;
}
// Construction Job sites

entity JobSites : cuid,managed{

    siteCode     : String(20);
    siteName     : String(100);
    location     : String(150);
    siteEngineer : String(100);
    contactPhone : String(20);
    booking      : Association to many Bookings
                       on booking.jobSite = $self;

}

entity Bookings : cuid,managed {

    bookingNumber   : String(20);
    machine         : Association to Machinery;
    jobSite         : Association to JobSites;

    startDate       : Date;
    endDate         : Date;
    totalDates      : Integer;
    totalCost       : Decimal(10, 2);

    operatorName    : String(100);
    status          : String(20) default 'CONFIRMED';

    returnCondition : String(200);
}
