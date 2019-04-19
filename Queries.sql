-- 1) How many distinct guest have made bookings for a particular month?booking
SELECT DISTINCT Booking.Guests_GuestId as guestsInAugust,guests.GuestName
FROM Booking join guests on guests.GuestId=booking.Guests_GuestId
WHERE MONTH(BookingDate) = 08;



-- 2)How many available rooms are in a particular hotel for a given date?
SELECT DISTINCT COUNT(OccupiedRooms) AS No_Of_Available_Rooms, hotels.HotelId,HotelName
from hotels join booking on hotels.HotelId = booking.Hotels_HotelId
where DATE(booking.CheckInDate)!='2018-08-13';




-- 3)How many hotels are in a hotel chain?
DROP PROCEDURE IF EXISTS getHotels;
DELIMITER //
CREATE PROCEDURE getHotels(IN chainId int)
 BEGIN
 SELECT COUNT(HotelId),hotelchain.HotelChainName
 FROM hotels join hotelchain
 on hotels.HotelChain_HotelChainId=hotelchain.HotelChainId
 WHERE HotelChain_HotelChainId = chainId;
 END //
DELIMITER ;

CALL getHotels(4);


-- 4)How many books has a customer made in one year?
SELECT guests.GuestId,guests.GuestName,COUNT(BookingId) as No_of_bookings
FROM booking join guests
on guests.GuestId=booking.Guests_GuestId
WHERE (BookingDate BETWEEN '2018-01-01 00:00:00' AND '2018-12-31 23:59:59') AND Guests_GuestId = 1;


-- 5)How many rooms are booked in a particular hotel on a given date?
SELECT DISTINCT COUNT(OccupiedRooms) AS No_Of_Booked_Rooms, hotels.HotelId,HotelName,booking.BookingDate
from hotels join booking on hotels.HotelId = booking.Hotels_HotelId
where DATE(booking.CheckInDate)='2018-08-13';



-- 6)List all the unique countries hotels are located in.
SELECT DISTINCT HotelCountry FROM hotels;


-- 7)How many rooms are available in a given hotel?
DROP PROCEDURE IF EXISTS getRoomsAvail;
DELIMITER //
CREATE PROCEDURE getRoomsAvail(IN hotelIdParam int)
 BEGIN
 SELECT HotelName,AvailableRooms
 FROM hotels
 WHERE HotelId = hotelIdParam;
 END //
DELIMITER ;

CALL getRoomsAvail(1);


-- 8)List all the hotels that have a URL available.
DROP VIEW IF EXISTS selectHotel;
CREATE VIEW selectHotel
AS SELECT HotelName FROM hotels WHERE HotelURL IS NOT NULL;

SELECT * FROM selectHotel;

-- 9)List the rate for a room at a given time during the year.

DROP PROCEDURE IF EXISTS getDiscountRate;
DELIMITER //
CREATE PROCEDURE getDiscountRate(IN roomIdParam int)
 BEGIN
 SELECT roomtype.RoomTypeRate - (discount.DiscountPercent*roomtype.RoomTypeRate)/100 AS DiscountedRate
 FROM rooms JOIN discount ON rooms.Discount_DiscountId = discount.DiscountId JOIN roomtype ON rooms.RoomType_RoomTypeId= roomtype.RoomTypeId
 WHERE RoomId = roomIdParam;
 END //
DELIMITER ;
 
CALL getDiscountRate(5);

