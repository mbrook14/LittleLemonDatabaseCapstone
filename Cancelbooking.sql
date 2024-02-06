DELIMITER //
CREATE PROCEDURE CancelBooking( IN book_id INT)
BEGIN
	SET @booking := (SELECT Booking_ID FROM Bookings WHERE Booking_ID = book_id);
	IF @booking THEN
		SET @order := (SELECT Order_ID FROM Orders WHERE Booking_ID = book_id);
		DELETE FROM Orders_Details WHERE OrderID = @order;
		DELETE FROM Orders_Delivery_Status WHERE Order_ID = @order;
		DELETE FROM Orders WHERE Booking_ID = book_id;
		DELETE FROM Bookings WHERE Booking_ID = book_id;
		SELECT CONCAT("Booking ", book_id, " is cancelled.") AS "Confirmation";
	ELSE
		SELECT CONCAT("There is no booking with booking id ", book_id) AS "Confirmation";
	END IF;
END//
DELIMITER ;