CREATE TABLE "VehicleType" (
  "Vehicle_Type" varchar PRIMARY KEY,
  "Vehicle_Type_Desc" varchar(20)
);

CREATE TABLE "RoadSurfaceType" (
  "Road_Surface_Type" varchar PRIMARY KEY,
  "Road_Surface_Type_Desc" varchar
);

CREATE TABLE "TrafficControl" (
  "Traffic_Control" varchar PRIMARY KEY,
  "Traffic_Control_Desc" varchar
);

CREATE TABLE "SubDCACode" (
  "Sub_DCA_Code" varchar PRIMARY KEY,
  "Sub_DCA_Code_Desc" varchar
);

CREATE TABLE "SurfaceCond" (
  "Surface_Cond" varchar PRIMARY KEY,
  "Surface_Cond_Desc" varchar
);

CREATE TABLE "InjLevel" (
  "Inj_Level" int PRIMARY KEY,
  "Inj_Level_Desc" varchar
);

CREATE TABLE "RoadUser" (
  "Road_User_Type" varchar PRIMARY KEY,
  "Road_User_Type_Desc" varchar
);

CREATE TABLE "AtmosphCond" (
  "Atmosph_Cond" varchar PRIMARY KEY,
  "Atmosph_Cond_Desc" varchar
);

CREATE TABLE "Atmospheric" (
  "Accident_No" varchar,
  "Atmosph_Cond_Seq" int,
  "Atmosph_Cond" varchar,
  PRIMARY KEY ("Accident_No", "Atmosph_Cond_Seq")
);

CREATE TABLE "VehicleColl" (
  "Vehicle_Coll_PT" varchar PRIMARY KEY,
  "Vehicle_Coll_PT_Desc" varchar
);

CREATE TABLE "EventType" (
  "Event_Type" varchar PRIMARY KEY,
  "Event_Type_Desc" varchar
);

CREATE TABLE "ObjectType" (
  "Object_Type" varchar PRIMARY KEY,
  "Object_Type_Desc" varchar
);

CREATE TABLE "RoadGeometry" (
  "Road_Geometry" varchar PRIMARY KEY,
  "Road_Geometry_Desc" varchar
);

CREATE TABLE "DCAInfo" (
  "DCA_Code" varchar PRIMARY KEY,
  "DCA_Desc" varchar
);

CREATE TABLE "AccidentType" (
  "Accident_Type" varchar PRIMARY KEY,
  "Accident_Type_Desc" varchar
);

CREATE TABLE "Vehicle" (
  "Accident_No" varchar,
  "Vehicle_ID" varchar,
  "Vehicle_Year_Manuf" varchar(4),
  "Vehicle_DCA_Code" varchar,
  "Inital_Direction" varchar,
  "Road_Surface_Type" varchar,
  "Reg_State" varchar,
  "Vehicle_Body_Style" varchar,
  "Vehicle_make" varchar,
  "Vehicle_Model" varchar,
  "Vehicle_Type" varchar,
  "Vehicle_Weight" float,
  "Fuel_Type" varchar,
  "No_Wheels" int,
  "No_Cylinder" float,
  "Seating_Capacity" int,
  "Total_No_Occupants" int,
  "Carry_Capacity" float,
  "Final_Direction" varchar,
  "Driver_Intent" varchar,
  "Vehicle_Movement" varchar,
  "Trailer_Type" varchar,
  "Vehicle_Colour_1" varchar,
  "Vehicle_Color_2" varchar,
  "Caught_Fire" varchar,
  "Inital_Impact" varchar,
  "Lamps" int,
  "Level_of_Damage" varchar,
  "Towed_Away_Flag" varchar,
  "Traffic_Control" varchar,
  PRIMARY KEY ("Accident_No", "Vehicle_ID")
);

CREATE TABLE "SubDCA" (
  "Accident_No" varchar,
  "Sub_DCA_Seq" varchar,
  "Sub_DCA_Code" varchar,
  PRIMARY KEY ("Accident_No", "Sub_DCA_Seq")
);

CREATE TABLE "AccidentEvent" (
  "Accident_No" varchar,
  "Event_Seq_No" int,
  "Event_Type" varchar(1),
  "Vehicle_1_ID" varchar(2),
  "Vehicle_1_Coll_PT" varchar(2),
  "Vehicle_2_Id" varchar(2),
  "Vehicle_2_Coll_PT" varchar(2),
  "Person_ID" varchar(2),
  "Object_Type" varchar(2),
  PRIMARY KEY ("Accident_No", "Event_Seq_No")
);

CREATE TABLE "AccidentInfo" (
  "Accident_No" varchar(255) PRIMARY KEY,
  "Accident_Date" date,
  "Accident_Time" time,
  "Accident_Type" varchar,
  "Day_Week_Desc" varchar,
  "DCA_Code" varchar,
  "Light_Condition" varchar,
  "Node_ID" varchar(10),
  "No_of_Vehicles" int,
  "No_Person_Killed" int,
  "No_Person_inj_2" int,
  "No_Person_inj_3" int,
  "No_Person_inj" int,
  "No_Persons" int,
  "Pollie_Attend" int,
  "Road_Geometry" varchar(2),
  "Severity" int,
  "Speed_Zone" int,
  "RMA" varchar,
  "Road_Name" varchar(255),
  "Road_Type" varchar(255),
  "Road_Name_Int" varchar(255),
  "Road_Type_Int" varchar(255),
  "Direction_Location" varchar(2),
  "Surface_Cond" varchar(1),
  "Surface_Cond_Seq" int,
  "LGA_Name" varchar(255),
  "Deg_Urban_Name" varchar(255),
  "Latitude" float,
  "Longitude" float,
  "Postcode_Crash" varchar(4)
);

CREATE TABLE "Person" (
  "Accident_No" varchar,
  "Person_ID" varchar,
  "Vehicle_ID" varchar,
  "Sex" varchar,
  "Age_Group" varchar,
  "Inj_Level" varchar,
  "Seating_Position" varchar,
  "Helmet_Belt_Worn" varchar,
  "Road_User_Type" varchar,
  "License_State" varchar,
  "Taken_Hospital" varchar,
  "Ejected_Code" varchar,
  PRIMARY KEY ("Accident_No", "Person_ID", "Vehicle_ID")
);

ALTER TABLE "Atmospheric" ADD FOREIGN KEY ("Atmosph_Cond") REFERENCES "AtmosphCond" ("Atmosph_Cond");

ALTER TABLE "AccidentInfo" ADD FOREIGN KEY ("Accident_No") REFERENCES "Atmospheric" ("Accident_No");

ALTER TABLE "Vehicle" ADD FOREIGN KEY ("Road_Surface_Type") REFERENCES "RoadSurfaceType" ("Road_Surface_Type");

ALTER TABLE "Vehicle" ADD FOREIGN KEY ("Vehicle_Type") REFERENCES "VehicleType" ("Vehicle_Type");

ALTER TABLE "Vehicle" ADD FOREIGN KEY ("Traffic_Control") REFERENCES "TrafficControl" ("Traffic_Control");

ALTER TABLE "SubDCA" ADD FOREIGN KEY ("Sub_DCA_Code") REFERENCES "SubDCACode" ("Sub_DCA_Code");

ALTER TABLE "AccidentInfo" ADD FOREIGN KEY ("Accident_No") REFERENCES "SubDCA" ("Accident_No");

ALTER TABLE "AccidentEvent" ADD FOREIGN KEY ("Event_Type") REFERENCES "EventType" ("Event_Type");

ALTER TABLE "AccidentEvent" ADD FOREIGN KEY ("Vehicle_1_Coll_PT") REFERENCES "VehicleColl" ("Vehicle_Coll_PT");

ALTER TABLE "AccidentEvent" ADD FOREIGN KEY ("Vehicle_2_Coll_PT") REFERENCES "VehicleColl" ("Vehicle_Coll_PT");

ALTER TABLE "AccidentEvent" ADD FOREIGN KEY ("Object_Type") REFERENCES "ObjectType" ("Object_Type");

ALTER TABLE "AccidentInfo" ADD FOREIGN KEY ("Accident_Type") REFERENCES "AccidentType" ("Accident_Type");

ALTER TABLE "AccidentInfo" ADD FOREIGN KEY ("DCA_Code") REFERENCES "DCAInfo" ("DCA_Code");

ALTER TABLE "AccidentInfo" ADD FOREIGN KEY ("Road_Geometry") REFERENCES "RoadGeometry" ("Road_Geometry");

ALTER TABLE "AccidentInfo" ADD FOREIGN KEY ("Surface_Cond") REFERENCES "SurfaceCond" ("Surface_Cond");

ALTER TABLE "Person" ADD FOREIGN KEY ("Inj_Level") REFERENCES "InjLevel" ("Inj_Level");

ALTER TABLE "Person" ADD FOREIGN KEY ("Road_User_Type") REFERENCES "RoadUser" ("Road_User_Type");

ALTER TABLE "AccidentInfo" ADD FOREIGN KEY ("Accident_No") REFERENCES "Vehicle" ("Accident_No");

ALTER TABLE "AccidentInfo" ADD FOREIGN KEY ("Accident_No") REFERENCES "AccidentEvent" ("Accident_No");

ALTER TABLE "AccidentInfo" ADD FOREIGN KEY ("Accident_No") REFERENCES "Person" ("Accident_No");
