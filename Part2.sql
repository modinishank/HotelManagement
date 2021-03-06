CREATE SEQUENCE seq_guest
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10

CREATE TABLE BookingReference
(
bookingID VARCHAR2(4) PRIMARY KEY,
hotelID VARCHAR2(4),
roomNo VARCHAR2(4),
guestID VARCHAR2(4),
startDate DATE,
endDate DATE)

CREATE SEQUENCE seq_booking
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 2

-------------------------------------------------------------------------------------------------------------------
--Quires used in project 
-------------------------------------------------------------------------------------------------------------------
SELECT H.HOTELID,H.HOTELNAME,H.CITY,R.ROOMNO,R.PRICE FROM ROOM R,HOTEL H WHERE H.HOTELID=R.HOTELID
AND H.HOTELNAME='Oberoi'
AND H.CITY='Waterloo'
AND R.ROOMTYPE='Double'
AND R.PRICE=50
AND (H.HOTELNAME,R.ROOMNO) NOT IN(
SELECT HO.HOTELNAME,B.ROOMNO FROM BOOKING B,HOTEL HO WHERE B.HOTELID=HO.HOTELID AND
((B.STARTDATE = to_date ('2015-03-20', 'YYYY-MM-DD') AND B.ENDDATE = to_date ('2015-03-25', 'YYYY-MM-DD'))
OR (B.STARTDATE > to_date ('2015-03-20', 'YYYY-MM-DD') AND B.STARTDATE < to_date ('2015-03-25', 'YYYY-MM-DD'))
OR (B.ENDDATE > to_date ('2015-03-20', 'YYYY-MM-DD') AND B.ENDDATE < to_date ('2015-03-25', 'YYYY-MM-DD'))
OR (B.STARTDATE < to_date ('2015-03-20', 'YYYY-MM-DD') AND B.ENDDATE > to_date ('2015-03-25', 'YYYY-MM-DD'))
OR (B.STARTDATE > to_date ('2015-03-20', 'YYYY-MM-DD') AND B.ENDDATE < to_date ('2015-03-25', 'YYYY-MM-DD'))))
-------------------------------------------------------------------------------------------------------------------
SELECT H.HOTELID,H.HOTELNAME,H.CITY,R.ROOMNO,R.PRICE FROM ROOM R,HOTEL H WHERE H.HOTELID=R.HOTELID
AND H.CITY='Waterloo'
AND R.ROOMTYPE='Double'
AND R.PRICE=50
AND (H.HOTELNAME,R.ROOMNO) NOT IN(
SELECT HO.HOTELNAME,B.ROOMNO FROM BOOKING B,HOTEL HO WHERE B.HOTELID=HO.HOTELID AND
((B.STARTDATE = to_date ('2015-03-20', 'YYYY-MM-DD') AND B.ENDDATE = to_date ('2015-03-25', 'YYYY-MM-DD'))
OR (B.STARTDATE > to_date ('2015-03-20', 'YYYY-MM-DD') AND B.STARTDATE < to_date ('2015-03-25', 'YYYY-MM-DD'))
OR (B.ENDDATE > to_date ('2015-03-20', 'YYYY-MM-DD') AND B.ENDDATE < to_date ('2015-03-25', 'YYYY-MM-DD'))
OR (B.STARTDATE < to_date ('2015-03-20', 'YYYY-MM-DD') AND B.ENDDATE > to_date ('2015-03-25', 'YYYY-MM-DD'))
OR (B.STARTDATE > to_date ('2015-03-20', 'YYYY-MM-DD') AND B.ENDDATE < to_date ('2015-03-25', 'YYYY-MM-DD'))))
--------------------------------------------------------------------------------------------------------------------
SELECT H.HOTELID,H.HOTELNAME,H.CITY,R.ROOMNO,R.PRICE FROM ROOM R,HOTEL H WHERE H.HOTELID=R.HOTELID
AND H.CITY='Waterloo'
AND R.ROOMTYPE='Double'
AND (H.HOTELNAME,R.ROOMNO) NOT IN(
SELECT HO.HOTELNAME,B.ROOMNO FROM BOOKING B,HOTEL HO WHERE B.HOTELID=HO.HOTELID AND
((B.STARTDATE = to_date ('2015-03-20', 'YYYY-MM-DD') AND B.ENDDATE = to_date ('2015-03-25', 'YYYY-MM-DD'))
OR (B.STARTDATE > to_date ('2015-03-20', 'YYYY-MM-DD') AND B.STARTDATE < to_date ('2015-03-25', 'YYYY-MM-DD'))
OR (B.ENDDATE > to_date ('2015-03-20', 'YYYY-MM-DD') AND B.ENDDATE < to_date ('2015-03-25', 'YYYY-MM-DD'))
OR (B.STARTDATE < to_date ('2015-03-20', 'YYYY-MM-DD') AND B.ENDDATE > to_date ('2015-03-25', 'YYYY-MM-DD'))
OR (B.STARTDATE > to_date ('2015-03-20', 'YYYY-MM-DD') AND B.ENDDATE < to_date ('2015-03-25', 'YYYY-MM-DD'))))
--------------------------------------------------------------------------------------------------------------------

DELETE BookingReference
DELETE BOOKING
DELETE Guest
DELETE room
DELETE hotel
DROP PROCEDURE PopulateHotelRooms
DROP TRIGGER caseOne
DROP TRIGGER casetwo
DROP TRIGGER casethree
DROP TRIGGER casefour
DROP TRIGGER casefive
DROP SEQUENCE seq_guest
DROP SEQUENCE seq_booking


INSERT INTO HOTEL (HOTELID, HOTELNAME, CITY)
VALUES ('AA01', 'Surya', 'Waterloo');
INSERT INTO HOTEL (HOTELID, HOTELNAME, CITY)
VALUES ('BB01', 'Taj', 'Kitchener');
INSERT INTO HOTEL (HOTELID, HOTELNAME, CITY)
VALUES ('CC01', 'Oberoi', 'Waterloo');

BEGIN
 POPULATEHOTELROOMS('AA01',4,2);
END;

BEGIN
 POPULATEHOTELROOMS('BB01',2,4);
END;

BEGIN
 POPULATEHOTELROOMS('CC01',2,2);
END;
