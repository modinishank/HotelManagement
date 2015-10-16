---------------------------------------------------------------------------------
--SQL DDL Statements
---------------------------------------------------------------------------------
CREATE TABLE HOTEL
(
hotelID VARCHAR2(4) PRIMARY KEY,
hotelName VARCHAR2(30),
city varchar(255) check (city in ('Guelph','Kitchener','Waterloo'))
)

CREATE TABLE Room
(
hotelID VARCHAR2(4),
roomNo VARCHAR2(4),
price DECIMAL(5,2) CHECK (price>49.99 AND price<250.01),
roomType VARCHAR(6) CHECK (roomType in ('Single','Double','Queen','King')),
CONSTRAINT pk_room PRIMARY KEY(hotelID, roomNo),
CONSTRAINT fk_room FOREIGN KEY (hotelID) REFERENCES HOTEL(hotelID)
)

CREATE TABLE Guest
(
guestID VARCHAR2(4) PRIMARY KEY,
guestName VARCHAR2(30),
guestAddress VARCHAR2(50),
guestAffiliation VARCHAR2(30)
)

CREATE TABLE ContactUs
(
contactName VARCHAR2(30),
contactEmail VARCHAR2(70),
contactMessage VARCHAR2(200),
contactNumber VARCHAR2(15)
)

CREATE TABLE Booking
(
hotelID VARCHAR2(4),
roomNo VARCHAR2(4),
guestID VARCHAR2(4),
startDate DATE,
endDate DATE,
CONSTRAINT pk_booking PRIMARY KEY(hotelID,roomNo,guestID,startDate),
CONSTRAINT fk_booking2 FOREIGN KEY (hotelID,roomNo) REFERENCES Room(hotelID,roomNo),
CONSTRAINT fk_booking3 FOREIGN KEY (guestID) REFERENCES Guest(guestID)
)

CREATE TABLE BookingLog
(
hotelID VARCHAR2(4),
roomNo VARCHAR2(4),
guestID VARCHAR2(4),
startDate DATE,
endDate DATE,
userID VARCHAR2(4),
changeTime TIMESTAMP
)

ALTER SESSION SET nls_date_format='yyyy-mm-dd';

----------------------------------------------------------------------------------------------
--Procedure to populate hotel rooms
----------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PopulateHotelRooms(hID IN VARCHAR2, noFloors IN NUMBER, noFRooms IN NUMBER) IS
floorCounter NUMBER;
roomcounter NUMBER;
roomNumber VARCHAR2(4);
BEGIN
FOR floorCounter IN 1..noFloors
   LOOP
     FOR roomCounter IN 1..noFRooms
       LOOP
         roomNumber := floorCounter || roomCounter;
         INSERT INTO ROOM (HOTELID, ROOMNO, PRICE, ROOMTYPE) VALUES (hID, roomNumber, 50.00, 'Double'); 
       END LOOP;
   END LOOP;
END;

----------------------------------------------------------------------------------------------
--Validation Triggers
----------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER caseOne BEFORE INSERT OR UPDATE ON BOOKING FOR EACH ROW
DECLARE
	flag NUMBER;
BEGIN
SELECT count(1) INTO flag FROM BOOKING WHERE (ROOMNO = :NEW.ROOMNO) AND (STARTDATE = :NEW.STARTDATE) AND (ENDDATE = :NEW.ENDDATE);
IF (flag<>0) THEN
	dbms_output.PUT_LINE('new value' || :New.roomno);
	dbms_output.PUT_LINE('new value' || flag);
	raise_application_error( -20001, 'Sorry this room is not available at given time');
END IF;
END;


CREATE OR REPLACE TRIGGER caseTwo BEFORE INSERT OR UPDATE ON BOOKING FOR EACH ROW
DECLARE
	flag NUMBER;
BEGIN
SELECT count(1) INTO flag FROM BOOKING WHERE (ROOMNO = :NEW.ROOMNO) AND (STARTDATE > :NEW.STARTDATE) AND (STARTDATE < :NEW.ENDDATE);
IF (flag<>0) THEN
	dbms_output.PUT_LINE('new value' || :New.roomno);
	dbms_output.PUT_LINE('new value' || flag);
	raise_application_error( -20001, 'Sorry this room is not available at given time');
END IF;
END;

CREATE OR REPLACE TRIGGER caseThree BEFORE INSERT OR UPDATE ON BOOKING FOR EACH ROW
DECLARE
	flag NUMBER;
BEGIN
SELECT count(1) INTO flag FROM BOOKING WHERE (ROOMNO = :NEW.ROOMNO) AND (ENDDATE > :NEW.STARTDATE) AND (ENDDATE < :NEW.ENDDATE);
IF (flag<>0) THEN
	dbms_output.PUT_LINE('new value' || :New.roomno);
	dbms_output.PUT_LINE('new value' || flag);
	raise_application_error( -20001, 'Sorry this room is not available at given time');
END IF;
END;

CREATE OR REPLACE TRIGGER caseFour BEFORE INSERT OR UPDATE ON BOOKING FOR EACH ROW
DECLARE
	flag NUMBER;
BEGIN
SELECT count(1) INTO flag FROM BOOKING WHERE (ROOMNO = :NEW.ROOMNO) AND (STARTDATE < :NEW.STARTDATE) AND (ENDDATE > :NEW.ENDDATE);
IF (flag<>0) THEN
	dbms_output.PUT_LINE('new value' || :New.roomno);
	dbms_output.PUT_LINE('new value' || flag);
	raise_application_error( -20001, 'Sorry this room is not available at given time');
END IF;
END;

CREATE OR REPLACE TRIGGER caseFive BEFORE INSERT OR UPDATE ON BOOKING FOR EACH ROW
DECLARE
	flag NUMBER;
BEGIN
SELECT count(1) INTO flag FROM BOOKING WHERE (ROOMNO = :NEW.ROOMNO) AND (STARTDATE > :NEW.STARTDATE) AND (ENDDATE < :NEW.ENDDATE);
IF (flag<>0) THEN
	dbms_output.PUT_LINE('new value' || :New.roomno);
	dbms_output.PUT_LINE('new value' || flag);
	raise_application_error( -20001, 'Sorry this room is not available at given time');
END IF;
END;

CREATE OR REPLACE TRIGGER bookingLogUpdate AFTER INSERT ON BOOKING FOR EACH ROW
DECLARE
	flag NUMBER;
BEGIN
INSERT INTO BOOKINGLOG (HOTELID, ROOMNO, GUESTID, STARTDATE, ENDDATE, USERID, CHANGETIME) 
VALUES (:NEW.HOTELID, :NEW.ROOMNO, :NEW.GUESTID, :NEW.STARTDATE, :NEW.ENDDATE, 'NDM',CURRENT_TIMESTAMP);
END;

-------------------------------------------------------------------------------------------------