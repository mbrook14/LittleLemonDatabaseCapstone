DELIMITER //
CREATE PROCEDURE CheckBooking(IN book_date VARCHAR(45), IN table_no INT)
BEGIN
	SET @booking := (SELECT Booking_ID FROM Bookings WHERE Booking_Date = book_date AND Table_Number = table_no);
	IF @booking THEN
		SELECT CONCAT("Table ", table_no, " is already booked.") AS "Booking Status";
		END IF;
END//
DELIMITER ;

-- To call the procedure
CALL CheckBooking("2022-08-10 12:00:00", 5);