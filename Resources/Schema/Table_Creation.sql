-- Drop Tables

DROP TABLE SubDCA;
DROP TABLE SubDCACode;

DROP TABLE Vehicle;
DROP TABLE RoadSurfaceType;
DROP TABLE VehicleType;
DROP TABLE TrafficControl;

DROP TABLE Person;
DROP TABLE InjLevel;
DROP TABLE RoadUser;

DROP TABLE AccidentEvent;
DROP TABLE EventType;
DROP TABLE VehicleColl;
DROP TABLE ObjectType;


DROP TABLE Atmospheric;
DROP TABLE AtmosphCond;

DROP TABLE AccidentInfo;
DROP TABLE AccidentType;
DROP TABLE DCAInfo;
DROP TABLE RoadGeometry;
DROP TABLE SurfaceCond;




-- Create Tables

CREATE TABLE SubDCACode (
  Sub_DCA_Code varchar PRIMARY KEY,
  Sub_DCA_Code_Desc varchar(200) NOT NULL
);

CREATE TABLE SubDCA (
  Accident_No varchar,
  Sub_DCA_Code varchar,
	Sub_DCA_Seq varchar,
  CONSTRAINT PK_SubDCA PRIMARY KEY (Accident_No, Sub_DCA_Seq),
  CONSTRAINT FK_SubDcaCode FOREIGN KEY (Sub_DCA_Code) REFERENCES SubDCACode(Sub_DCA_Code)
);

CREATE TABLE AccidentType (
  Accident_Type varchar PRIMARY KEY,
  Accident_Type_Desc varchar(200) NOT NULL
);

CREATE TABLE DCAInfo (
  DCA_Code varchar PRIMARY KEY,
  DCA_Desc varchar(200) NOT NULL
);

CREATE TABLE RoadGeometry (
  Road_Geometry varchar PRIMARY KEY,
  Road_Geometry_Desc varchar(200) NOT NULL
);

CREATE TABLE SurfaceCond (
  Surface_Cond varchar PRIMARY KEY,
  Surface_Cond_Desc varchar(200) NOT NULL 
);

CREATE TABLE AccidentInfo (
  Accident_No varchar(255),
  Accident_Date date,
  Accident_Time time,
  Accident_Type varchar,
  Day_Week_Desc varchar,
  DCA_Code varchar,
  Light_Condition varchar,
  Node_ID varchar(10),
  No_of_Vehicles int,
  No_Person_Killed int,
  No_Person_inj_2 int,
  No_Person_inj_3 int,
  No_Person_inj int,
  No_Persons int,
  Pollie_Attend int,
  Road_Geometry varchar(2),
  Severity int,
  Speed_Zone int,
  RMA varchar,
  Road_Name varchar(255),
  Road_Type varchar(255),
  Road_Name_Int varchar(255),
  Road_Type_Int varchar(255),
  Direction_Location varchar(2),
  Surface_Cond varchar(1),
  Surface_Cond_Seq int,
  LGA_Name varchar(255),
  Deg_Urban_Name varchar(255),
  Latitude float,
  Longitude float,
  Postcode_Crash varchar(4),
	CONSTRAINT PK_AccidentInfo PRIMARY KEY (Accident_No),
	CONSTRAINT FK_AccidentType FOREIGN KEY (Accident_Type) REFERENCES AccidentType(Accident_Type),
	CONSTRAINT FK_DCACode FOREIGN KEY (DCA_Code) REFERENCES DCAInfo(DCA_Code),
	CONSTRAINT FK_RoadGeometry FOREIGN KEY (Road_Geometry) REFERENCES RoadGeometry(Road_Geometry),
	CONSTRAINT FK_SurfaceCond FOREIGN KEY (Surface_Cond) REFERENCES SurfaceCond(Surface_Cond)
);

CREATE TABLE AtmosphCond (
  Atmosph_Cond varchar(10),
  Atmosph_Cond_Desc varchar(200) NOT NULL,
	CONSTRAINT PK_Atmosph_Cond Primary KEY (Atmosph_Cond)
 );
 
CREATE TABLE Atmospheric (
  Accident_No varchar,
  Atmosph_Cond varchar(10) NOT NULL,
	Atmosph_Cond_Seq int NOT NULL,
  CONSTRAINT PK_Atmospheric PRIMARY KEY (Accident_No, Atmosph_Cond_Seq),
	CONSTRAINT FK_Atmosph_Cond FOREIGN KEY (Atmosph_Cond) REFERENCES AtmosphCond(Atmosph_Cond)
);

CREATE TABLE RoadSurfaceType (
  Road_Surface_Type varchar PRIMARY KEY,
  Road_Surface_Type_Desc varchar(20) NOT NULL
);

CREATE TABLE VehicleType (
  Vehicle_Type varchar PRIMARY KEY,
  Vehicle_Type_Desc varchar(50) NOT NULL
);

CREATE TABLE TrafficControl (
  Traffic_Control varchar PRIMARY KEY,
  Traffic_Control_Desc varchar(300) NOT NULL 
);

CREATE TABLE Vehicle (
  Accident_No varchar,
  Vehicle_ID varchar,
  Vehicle_Year_Manuf float,
  Vehicle_DCA_Code varchar,
  Inital_Direction varchar,
  Road_Surface_Type varchar,
  Reg_State varchar,
  Vehicle_Body_Style varchar,
  Vehicle_make varchar,
  Vehicle_Model varchar,
  Vehicle_Type varchar,
  Vehicle_Weight float,
  Fuel_Type varchar,
  No_Wheels int,
  No_Cylinder float,
  Seating_Capacity int,
  Total_No_Occupants int,
  Carry_Capacity float,
  Final_Direction varchar,
  Driver_Intent varchar,
  Vehicle_Movement varchar,
  Trailer_Type varchar,
  Vehicle_Colour_1 varchar,
  Vehicle_Color_2 varchar,
  Caught_Fire varchar,
  Inital_Impact varchar,
  Lamps int,
  Level_of_Damage varchar,
  Towed_Away_Flag varchar,
  Traffic_Control varchar,
  CONSTRAINT PK_Vehicle PRIMARY KEY (Accident_No, Vehicle_ID),
	CONSTRAINT FK_Road_Surface_Type FOREIGN KEY (Road_Surface_Type) REFERENCES RoadSurfaceType(Road_Surface_Type),
	CONSTRAINT FK_Vehicle_Type FOREIGN KEY (Vehicle_Type) REFERENCES VehicleType(Vehicle_Type),
	CONSTRAINT FK_Traffic_Control FOREIGN KEY (Traffic_Control) REFERENCES TrafficControl(Traffic_Control)
);



CREATE TABLE InjLevel (
  Inj_Level int PRIMARY KEY,
  Inj_Level_Desc varchar(200) NOT NULL
);

CREATE TABLE RoadUser (
  Road_User_Type varchar PRIMARY KEY,
  Road_User_Type_Desc varchar(200) NOT NULL
);


CREATE TABLE Person (
  Accident_No varchar,
  Person_ID varchar,
  Vehicle_ID varchar,
  Sex varchar,
  Age_Group varchar,
  Inj_Level int,
  Seating_Position varchar,
  Helmet_Belt_Worn varchar,
  Road_User_Type varchar,
  License_State varchar,
  Taken_Hospital varchar,
  Ejected_Code varchar,
  CONSTRAINT PK_Person PRIMARY KEY (Accident_No, Person_ID, Vehicle_ID),
	CONSTRAINT FK_Inj_Level FOREIGN KEY (Inj_Level) REFERENCES InjLevel(Inj_Level),
	CONSTRAINT FK_Road_User FOREIGN KEY (Road_User_Type) REFERENCES RoadUser(Road_User_Type)
);
CREATE TABLE EventType (
  Event_Type varchar PRIMARY KEY,
  Event_Type_Desc varchar(200) NOT NULL
);

CREATE TABLE VehicleColl (
  Vehicle_Coll_PT varchar PRIMARY KEY,
  Vehicle_Coll_PT_Desc varchar(200) NOT NULL
);

CREATE TABLE ObjectType (
  Object_Type varchar PRIMARY KEY,
  Object_Type_Desc varchar(200) NOT NULL
);

CREATE TABLE AccidentEvent (
  Accident_No varchar,
  Event_Seq_No int,
  Event_Type varchar(1),
  Vehicle_1_ID varchar(2),
  Vehicle_1_Coll_PT varchar(2),
  Vehicle_2_Id varchar(2),
  Vehicle_2_Coll_PT varchar(2),
  Person_ID varchar(2),
  Object_Type varchar(2),
  CONSTRAINT PK_AccidentEvent PRIMARY KEY (Accident_No, Event_Seq_No),
	CONSTRAINT FK_Event_Type FOREIGN KEY (Event_Type) REFERENCES EventType(Event_Type),
	CONSTRAINT FK_Vehicle_Coll_1 FOREIGN KEY (Vehicle_1_Coll_PT) REFERENCES VehicleColl(Vehicle_Coll_PT),
	CONSTRAINT FK_Vehicle_Coll_2 FOREIGN KEY (Vehicle_2_Coll_PT) REFERENCES VehicleColl(Vehicle_Coll_PT),
	CONSTRAINT FK_Object_Type FOREIGN KEY (Object_Type) REFERENCES ObjectType(Object_Type)
);
