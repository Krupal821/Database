-- Track bookings based on dates, booking type, and room count

CREATE VIEW TRACK_booking as select CheckInDate AS BOOKING_DATE,BookingType AS BOOKING_TYPE,hotels.OccupiedRooms as Rooms_booked
FROM booking JOIN hotels ON booking.Hotels_HotelId = hotels.HotelId;

SELECT * FROM TRACK_booking;

