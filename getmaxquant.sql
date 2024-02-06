DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(TQ.Total_Quantity) AS "Max Quantity in Order"
    FROM ((SELECT SUM(Quantity) AS Total_Quantity FROM Orders_Details GROUP BY OrderID)) AS TQ;
END//
DELIMITER ;

-- To call the procedure
CALL GetMaxQuantity();