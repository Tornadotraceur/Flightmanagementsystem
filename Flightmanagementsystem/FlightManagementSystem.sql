USE [FlightManagementSystem]
GO
/****** Object:  Table [dbo].[Adminstrators]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adminstrators](
	[Id] [bigint] NOT NULL,
	[First_Name] [text] NULL,
	[Last_Name] [text] NULL,
	[Level] [int] NULL,
	[User_Id] [bigint] NULL,
 CONSTRAINT [adminstrators_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airline_Companies]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airline_Companies](
	[Id] [bigint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
	[User_Id] [bigint] NOT NULL,
 CONSTRAINT [airline_companies_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[id] [bigint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [countries_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [bigint] NOT NULL,
	[First_Name] [text] NOT NULL,
	[Last_Name] [text] NOT NULL,
	[Address] [text] NOT NULL,
	[Phone_No] [varchar](50) NOT NULL,
	[Credit_Card_No] [varchar](50) NOT NULL,
	[User_Id] [bigint] NOT NULL,
 CONSTRAINT [customers_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flights]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flights](
	[id] [bigint] NOT NULL,
	[Airline_Company_Id] [bigint] NULL,
	[Origin_Country_Id] [int] NULL,
	[Destination_Country_Id] [int] NULL,
	[Departure_Time] [time](7) NULL,
	[Landing_Time] [time](7) NULL,
	[Remaining_Tickets] [int] NULL,
 CONSTRAINT [flights_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[id] [bigint] NOT NULL,
	[Flight_Id] [bigint] NULL,
	[Customer_Id] [bigint] NULL,
 CONSTRAINT [tickets_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Roles]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Roles](
	[Id] [bigint] NOT NULL,
	[Role_Name] [varchar](10) NOT NULL,
 CONSTRAINT [user_roles_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [text] NULL,
	[Email] [varchar](50) NULL,
	[User_Role] [int] NULL,
 CONSTRAINT [users_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adminstrators]  WITH CHECK ADD  CONSTRAINT [adminstrators_users_id_fk] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Adminstrators] CHECK CONSTRAINT [adminstrators_users_id_fk]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [customers_users_id_fk] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [customers_users_id_fk]
GO
ALTER TABLE [dbo].[Flights]  WITH CHECK ADD  CONSTRAINT [flights_airline_companies_id_fk] FOREIGN KEY([Airline_Company_Id])
REFERENCES [dbo].[Airline_Companies] ([Id])
GO
ALTER TABLE [dbo].[Flights] CHECK CONSTRAINT [flights_airline_companies_id_fk]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [tickets_customers_id_fk] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [tickets_customers_id_fk]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [tickets_flights_id_fk] FOREIGN KEY([Flight_Id])
REFERENCES [dbo].[Flights] ([id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [tickets_flights_id_fk]
GO
/****** Object:  StoredProcedure [dbo].[AddAdmin]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddAdmin] (@id            bigint,  
                                          @first_name    text,  
                                          @last_name     text,
										  @Level int,
										  @User_Id bigint )
                                         
AS  
  BEGIN  
        BEGIN  
            INSERT INTO Adminstrators  
                        (id,  
                         first_name,  
                         last_name,  
						 Level,
						 User_Id)

            VALUES     ( @id,  
                         @first_name,  
                         @last_name,  
                         @Level,  
                         @User_Id)  
        END
		end
GO
/****** Object:  StoredProcedure [dbo].[AddAirline]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddAirline] (@id            bigint,  
                                          @Name    varchar(50),  
                                          @Country_Id     int,
										  @User_Id bigint

									 )						
AS  
  BEGIN  
        BEGIN  
            INSERT INTO Airline_Companies  
                        (Id,  
                         Name,  
                         CountryId,
						 User_Id
					)

            VALUES     ( @id,  
                         @Name,  
                         @Country_Id,
						 @User_Id
                      )  
        END
		end
GO
/****** Object:  StoredProcedure [dbo].[AddCountre]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddCountre]
(
@id bigint = null,
@Name text = null
)
as 
begin 
insert into Countries
Values 
(
@id,
@Name
)

end 
GO
/****** Object:  StoredProcedure [dbo].[AddCoustomer]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddCoustomer] (@id            bigint,  
                                          @First_Name   text,  
                                          @Last_Name     text,
										  @Address text,
										  @Phone_No varchar(50),
										  @Credit_Card_No varchar(50),
										  @User_Id bigint

									 )						
AS  
  BEGIN  
        BEGIN  
            INSERT INTO Customers  
                        (Id,  
                         First_Name,  
                         Last_Name,
						 Address,
						 Phone_No,
						 Credit_Card_No,
						 User_Id
					)

            VALUES     ( @id,  
                         @First_Name,  
                         @Last_Name,
						 @Address,
						 @Phone_No,
						 @Credit_Card_No,
						 @User_Id
                      )  
        END
		end
GO
/****** Object:  StoredProcedure [dbo].[AddFlight]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddFlight] (@id            bigint,  
                                          @Airline_Company_Id   bigint,  
                                          @Origin_Country_Id     int,
										  @Destination_Country_Id int,
										  @Departure_Time time(7),
										  @Landing_Time time(7),
										  @Remaining_Tickets int

									 )						
AS  
  BEGIN  
        BEGIN  
            INSERT INTO Flights  
                        (Id,  
                         Airline_Company_Id,  
                         Origin_Country_Id,
						 Destination_Country_Id,
						 Departure_Time,
						 Landing_Time,
						 Remaining_Tickets
					)

            VALUES     ( @id,  
                         @Airline_Company_Id,  
                         @Origin_Country_Id,
						 @Destination_Country_Id,
						 @Departure_Time,
						 @Landing_Time,
						 @Remaining_Tickets
                      )  
        END
		end
GO
/****** Object:  StoredProcedure [dbo].[AddTicket]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddTicket] (@id            bigint,  
                                          @Flight_Id    bigint,  
                                          @Customer_Id     bigint
									 )						
AS  
  BEGIN  
        BEGIN  
            INSERT INTO Tickets  
                        (id,  
                         Flight_Id,  
                         Customer_Id
					)

            VALUES     ( @id,  
                         @Flight_Id,  
                         @Customer_Id  
                      )  
        END
		end
GO
/****** Object:  StoredProcedure [dbo].[GetAdmin]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAdmin]
(
@id            bigint,  
                                          @first_name    text,  
                                          @last_name     text,
										  @Level int,
										  @User_Id bigint )
										  as 
										  begin
										  select * from Adminstrators
										  end
GO
/****** Object:  StoredProcedure [dbo].[GetAirline]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAirline] (@id            bigint,  
   @Name    varchar(50),  
                                          @Country_Id     int,
										  @User_Id bigint )						
AS  
  BEGIN  
  select * from Airline_Companies

		end
GO
/****** Object:  StoredProcedure [dbo].[GetAirlineByCountry]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		create PROCEDURE [dbo].[GetAirlineByCountry] (  @CountryId    int)  						
AS  
  BEGIN  
  select CountryId from  Airline_Companies
  where CountryId = @CountryId
		end
GO
/****** Object:  StoredProcedure [dbo].[GetAirlineByUsername]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		create PROCEDURE [dbo].[GetAirlineByUsername] (  @Name    varchar(50)  )						
AS  
  BEGIN  
  select @Name from Tickets
  where @Name = @Name
		end
GO
/****** Object:  StoredProcedure [dbo].[GetAllCountries]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCountries]
AS
SELECT * FROM Countries
GO;
GO
/****** Object:  StoredProcedure [dbo].[GetCustomer]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetCustomer] (@id            bigint,  
                                          @First_Name   text,  
                                          @Last_Name     text,
										  @Address text,
										  @Phone_No varchar(50),
										  @Credit_Card_No varchar(50),
										  @User_Id bigint )						
AS  
  BEGIN  
  select * from Customers

		end
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerByUsername]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetCustomerByUsername] ( 
                                          @id   bigint 
 )						
AS  
  BEGIN  
  select First_Name from Customers
  where Id = @id
		end
GO
/****** Object:  StoredProcedure [dbo].[GetFlight]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFlight] (@id            bigint,  
                                          @Airline_Company_Id   bigint,  
                                          @Origin_Country_Id     int,
										  @Destination_Country_Id int,
										  @Departure_Time time(7),
										  @Landing_Time time(7),
										  @Remaining_Tickets int)						
AS  
  BEGIN  
  select * from Flights

		end
GO
/****** Object:  StoredProcedure [dbo].[GetFlightByDepartureTime]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFlightByDepartureTime] (@Departure_Time time(7))						
AS  
  BEGIN  
  select * from Flights
  where Departure_Time = @Departure_Time

		end
GO
/****** Object:  StoredProcedure [dbo].[GetFlightById]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFlightById](@id bigint)						
AS  
  BEGIN  
  select * from Flights
  where id = @id
		end
GO
/****** Object:  StoredProcedure [dbo].[GetFlightDestinationCountry]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFlightDestinationCountry] (@Destination_Country_Id int)						
AS  
  BEGIN  
  select Destination_Country_Id from Flights
  where Destination_Country_Id = @Destination_Country_Id
		end
GO
/****** Object:  StoredProcedure [dbo].[GetFlightLandingTime]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFlightLandingTime] (@Landing_Time time(7))						
AS  
  BEGIN  
  select Landing_Time from Flights
  where Landing_Time = @Landing_Time
		end
GO
/****** Object:  StoredProcedure [dbo].[GetFlightOriginCountry]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFlightOriginCountry](@Origin_Country_Id int)						
AS  
  BEGIN  
  select Origin_Country_Id from Flights
  where Origin_Country_Id = @Origin_Country_Id
		end
GO
/****** Object:  StoredProcedure [dbo].[GetTicke]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetTicke] (@id            bigint,  
                                          @Flight_Id    bigint,  
                                          @Customer_Id     bigint
									 )						
AS  
  BEGIN  
  select * from Tickets

		end
GO
/****** Object:  StoredProcedure [dbo].[RemoveAdmin]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[RemoveAdmin] (@id            bigint,  
                                          @first_name    text,  
                                          @last_name     text,
										  @Level int,
										  @User_Id bigint )
as
begin
delete  from Adminstrators
where Id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[RemoveAirline]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[RemoveAirline] (@id            bigint)						
AS  
  BEGIN  
  delete from Airline_Companies 
  where Id = @id
  end
GO
/****** Object:  StoredProcedure [dbo].[RemoveCuntre]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[RemoveCuntre]
( 
@id bigint,
@Name varchar(50)
)
as 
begin
delete from Countries where id = @id
delete from Countries where Name = @Name
end
GO
/****** Object:  StoredProcedure [dbo].[RemoveCustomer]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[RemoveCustomer] (@id            bigint)						
AS  
  BEGIN  
  delete from  Customers
  where Id = @id
  end
GO
/****** Object:  StoredProcedure [dbo].[RemoveFlight]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[RemoveFlight] (@id            bigint)						
AS  
  BEGIN  
  delete from  Flights
  where Id = @id
  end
GO
/****** Object:  StoredProcedure [dbo].[RemoveTicket]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[RemoveTicket] (@id            bigint,  
                                          @Flight_Id    bigint,  
                                          @Customer_Id     bigint
									 )						
AS  
  BEGIN  
  delete from Tickets 
  where id = @id
  end
GO
/****** Object:  StoredProcedure [dbo].[UpdateAdmin]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[UpdateAdmin] (@id            bigint,  
                                          @first_name    text,  
                                          @last_name     text,
										  @Level int,
										  @User_Id bigint )
as
begin
update Adminstrators
set
Id = @id,
First_Name = @first_name,
Last_Name = @last_name,
Level = @Level,
User_Id = @User_Id
where Id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateAirline]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[UpdateAirline] (@id            bigint,  
                                          @Name    varchar(50),  
                                          @Country_Id     int,
										  @User_Id bigint)
as
begin
update Airline_Companies
set
Id = @id,
Name = @Name,
CountryId = @Country_Id,
user_id = @User_Id
where Id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateCuntre]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateCuntre]
(
@id bigint,
@Name varchar(50)
)
as
begin
update Countries set id = @id , Name = @Name
where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[UpdateCustomer] (@id            bigint,  
                                          @First_Name   text,  
                                          @Last_Name     text,
										  @Address text,
										  @Phone_No varchar(50),
										  @Credit_Card_No varchar(50),
										  @User_Id bigint)
as
begin
update Customers
set
Id = @id,
First_Name = @First_Name,
Last_Name = @Last_Name,
Address = @Address,
Phone_No = @Phone_No,
Credit_Card_No = @Credit_Card_No,
User_Id = @User_Id
where Id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateFlight]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[UpdateFlight] (@id            bigint,  
                                          @Airline_Company_Id   bigint,  
                                          @Origin_Country_Id     int,
										  @Destination_Country_Id int,
										  @Departure_Time time(7),
										  @Landing_Time time(7),
										  @Remaining_Tickets int)
as
begin
update Flights
set
Id = @id,
Airline_Company_Id = @Airline_Company_Id,
Origin_Country_Id = @Origin_Country_Id,
Destination_Country_Id = @Destination_Country_Id,
Departure_Time = @Departure_Time,
Landing_Time = @Landing_Time,
Remaining_Tickets = @Remaining_Tickets
where Id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateTicket]    Script Date: 3/1/2021 12:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[UpdateTicket] (@id            bigint,  
                                          @Flight_Id    bigint,  
                                          @Customer_Id     bigint )
as
begin
update Tickets
set
Id = @id,
Flight_Id = @Flight_Id,
Customer_Id = @Customer_Id
where Id = @id
end
GO
