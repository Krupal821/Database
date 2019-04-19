-- Track guest view

CREATE VIEW TRACK_guest as select GuestName AS Guest_Name, GuestAddress AS Guest_Address,GuestCity AS Guest_City from guests;

Select * FROM TRACK_guest;
