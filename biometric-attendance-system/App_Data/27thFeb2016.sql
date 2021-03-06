USE [master]
GO
/****** Object:  Database [BiometricAttendanceManagementSystem]    Script Date: 27-Feb-16 5:55:23 PM ******/
CREATE DATABASE [BiometricAttendanceManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BiometricAttendanceManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BiometricAttendanceManagementSystem.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BiometricAttendanceManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BiometricAttendanceManagementSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BiometricAttendanceManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BiometricAttendanceManagementSystem]
GO
/****** Object:  StoredProcedure [dbo].[spAddRole]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Software Incubator
-- Create date: 04th October 2015
-- Description:	Add a new role
-- =============================================
CREATE PROCEDURE [dbo].[spAddRole] 
	-- Add the parameters for the stored procedure here
	@name nvarchar(Max), 
	@createdOn datetime,
    @updatedOn datetime,
    @isDeleted bit
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO 
	tblRole 
	VALUES(
		@name,
		@createdOn,
		@updatedOn,
		@isDeleted
		)
END


GO
/****** Object:  StoredProcedure [dbo].[spCreateDepartment]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Software Incubator
-- Create date: 02nd October 2015
-- Description:	Creates a new Department Entry
-- =============================================
CREATE PROCEDURE [dbo].[spCreateDepartment] 
	-- Add the parameters for the stored procedure here
	@name nvarchar(Max), 
	@createdOn datetime,
	@updatedOn datetime,
	@isDeleted bit
AS
BEGIN
	SET NOCOUNT ON;
	SELECT @name, @createdOn
	INSERT INTO tblDepartment 
	VALUES(
	@name,
	@createdOn,
	@updatedOn,
	@isDeleted)
END




GO
/****** Object:  StoredProcedure [dbo].[spDeleteDepartment]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Software Incubator
-- Create date: 11th November 2015
-- Description:	Delete Department by Id
-- =============================================
Create PROCEDURE [dbo].[spDeleteDepartment] 
@departmentId int,
@updatedAt datetime
AS
BEGIN
     SET NOCOUNT ON;
	 Update tblDepartment
 	 Set IsDeleted = 1 , UpdatedOn = @updatedAt where Id = @departmentId 
END




GO
/****** Object:  StoredProcedure [dbo].[spGetAllDepartments]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Software Incubator
-- Create date: 03rd October 2015
-- Description:	Returns all Departments
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllDepartments] 
	
AS
BEGIN

	SET NOCOUNT ON;
	SELECT 
			Id,
			Name 
	FROM    tblDepartment where IsDeleted = 0
END




GO
/****** Object:  StoredProcedure [dbo].[spGetAllRoles]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Software Incubator
-- Create date: 04th October 2015
-- Description:	Get all roles
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllRoles] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		Id,
		Name 
	FROM 
	    tblRole
	WHERE
		IsDeleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[spGetDepartmentById]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Software Incubator
-- Create date: 11th November 2015
-- Description:	Returns Department by Id
-- =============================================
CREATE PROCEDURE [dbo].[spGetDepartmentById] 
@departmentId int
AS
BEGIN
     SET NOCOUNT ON;
	 SELECT name from tblDepartment
 	 WHERE Id = @departmentId And IsDeleted = 0
END




GO
/****** Object:  StoredProcedure [dbo].[spGetRoleById]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Software Incubator
-- Create date: 12th November 2015
-- Description:	Returns Role by Id
-- =============================================
CREATE PROCEDURE [dbo].[spGetRoleById] 
@roleId int
AS
BEGIN
     SET NOCOUNT ON;
	 SELECT name from tblRole
 	 WHERE Id = @roleId
END


GO
/****** Object:  StoredProcedure [dbo].[spUpdateDepartment]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Software Incubator
-- Create date: 11th November 2015
-- Description:	Updates Department Name by Id
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateDepartment] 
@departmentId int,
@name nvarchar(MAX),
@updatedAt datetime
AS
BEGIN
     SET NOCOUNT ON;
	 UPDATE tblDepartment SET Name=@name, UpdatedOn = @updatedAt
	 Where Id = @departmentId
END


GO
/****** Object:  StoredProcedure [dbo].[spUpdateRole]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Software Incubator
-- Create date: 17th November 2015
-- Description:	Updates Role Name by Id
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateRole] 
@roleId int,
@name nvarchar(MAX),
@updatedAt datetime
AS
BEGIN
     SET NOCOUNT ON;
	 UPDATE tblRole SET Name=@name, UpdatedOn = @updatedAt
	 Where Id = @roleId
END



GO
/****** Object:  Table [dbo].[tblAttendance]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAttendance](
	[Sno] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[Date] [datetime] NOT NULL,
	[EntryTime] [time](0) NOT NULL,
	[ExitTime] [time](0) NULL,
 CONSTRAINT [PK_tblAttendance] PRIMARY KEY CLUSTERED 
(
	[Sno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblDepartment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployees]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployees](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[RoleId] [int] NULL,
	[DepartmentId] [int] NULL,
	[ContactNumber] [bigint] NULL,
	[WeeklyOffDay] [int] NOT NULL,
	[ShiftId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblEmployees_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployeesMaster]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeesMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FacultyId] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Gender] [nvarchar](max) NULL,
	[JoiningDate] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblEmployees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHolidays]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHolidays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Status] [int] NOT NULL,
	[NameOfHoliday] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.tblDays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLeave]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeave](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[Date] [datetime] NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblLeave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLeaveAssignedByRole]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeaveAssignedByRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[NoOfLeaves] [int] NOT NULL,
	[IsPromoted] [bit] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblLeaveAssignedByRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLeaveAssignedPerSession]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeaveAssignedPerSession](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[NoOfLeaves] [int] NULL,
	[SessionStartDate] [date] NOT NULL,
	[SessionEndDate] [date] NOT NULL,
 CONSTRAINT [PK_tblLeaveAssignedPerSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLeavesOldStock]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeavesOldStock](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[SLCount] [int] NOT NULL,
	[ELCount] [int] NOT NULL,
	[SessionStartDate] [date] NOT NULL,
	[SesssionEndDate] [date] NOT NULL,
 CONSTRAINT [PK_tblLeavesOldStock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMasterShifts]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMasterShifts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstHalfStart] [time](7) NOT NULL,
	[FirstHalfEnd] [time](7) NOT NULL,
	[SecondHalfStart] [time](7) NOT NULL,
	[SecondHalfEnd] [time](7) NOT NULL,
	[SLDuration] [time](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblMasterShifts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSession]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SessionStartDate] [datetime] NULL,
	[SessionEndDate] [datetime] NULL,
 CONSTRAINT [PK_tblSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTypeOfLeave]    Script Date: 27-Feb-16 5:55:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTypeOfLeave](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblTypeOfLeave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblDepartment] ON 

INSERT [dbo].[tblDepartment] ([Id], [Name], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (1, N'ECE', CAST(0x0000A43300000000 AS DateTime), CAST(0x0000A43300000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblDepartment] OFF
SET IDENTITY_INSERT [dbo].[tblEmployees] ON 

INSERT [dbo].[tblEmployees] ([Id], [EmployeeId], [ImagePath], [Password], [RoleId], [DepartmentId], [ContactNumber], [WeeklyOffDay], [ShiftId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (3, 1, N'asdf', N'1', 1, 1, 8800765562, 1, 2, CAST(0x0000A43300000000 AS DateTime), CAST(0x0000A43300000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblEmployees] OFF
SET IDENTITY_INSERT [dbo].[tblEmployeesMaster] ON 

INSERT [dbo].[tblEmployeesMaster] ([Id], [FacultyId], [Name], [Gender], [JoiningDate], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, N'100', N'Aditi', N'F', CAST(0x0000A43300000000 AS DateTime), CAST(0x0000A43300000000 AS DateTime), CAST(0x0000A43300000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblEmployeesMaster] OFF
SET IDENTITY_INSERT [dbo].[tblMasterShifts] ON 

INSERT [dbo].[tblMasterShifts] ([Id], [FirstHalfStart], [FirstHalfEnd], [SecondHalfStart], [SecondHalfEnd], [SLDuration], [IsActive], [CreatedOn], [UpdatedOn], [isDeleted]) VALUES (2, CAST(0x070040230E430000 AS Time), CAST(0x0700E03495640000 AS Time), CAST(0x070026F8B8640000 AS Time), CAST(0x0700A01187210000 AS Time), CAST(0x07009CA6920C0000 AS Time), 1, CAST(0x0000A5B90083D600 AS DateTime), CAST(0x0000A5B90083D600 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblMasterShifts] OFF
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([Id], [Name], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (1, N'Admin', CAST(0x0000A43300000000 AS DateTime), CAST(0x0000A43300000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblRole] OFF
ALTER TABLE [dbo].[tblEmployees] ADD  CONSTRAINT [DF_tblEmployees_DepartmentId]  DEFAULT ((1)) FOR [DepartmentId]
GO
ALTER TABLE [dbo].[tblEmployees] ADD  CONSTRAINT [DF_tblEmployees_WeeklyOffDay]  DEFAULT ((1)) FOR [WeeklyOffDay]
GO
ALTER TABLE [dbo].[tblEmployees] ADD  CONSTRAINT [DF_tblEmployees_ShiftId]  DEFAULT ((1)) FOR [ShiftId]
GO
ALTER TABLE [dbo].[tblEmployees] ADD  CONSTRAINT [DF_tblEmployees_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblEmployeesMaster] ADD  CONSTRAINT [DF_tblEmployeesMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblLeaveAssignedByRole] ADD  CONSTRAINT [DF_tblLeaveAssignedByRole_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblAttendance]  WITH CHECK ADD  CONSTRAINT [FK_tblAttendance_tblEmployeesMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployeesMaster] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAttendance] CHECK CONSTRAINT [FK_tblAttendance_tblEmployeesMaster]
GO
ALTER TABLE [dbo].[tblEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployees_tblDepartment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[tblDepartment] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployees_tblDepartment]
GO
ALTER TABLE [dbo].[tblEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployees_tblEmployeesMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployeesMaster] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployees_tblEmployeesMaster]
GO
ALTER TABLE [dbo].[tblEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployees_tblMasterShifts] FOREIGN KEY([ShiftId])
REFERENCES [dbo].[tblMasterShifts] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployees_tblMasterShifts]
GO
ALTER TABLE [dbo].[tblEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployees_tblRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployees_tblRole]
GO
ALTER TABLE [dbo].[tblLeave]  WITH CHECK ADD  CONSTRAINT [FK_tblLeave_tblEmployeesMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployeesMaster] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLeave] CHECK CONSTRAINT [FK_tblLeave_tblEmployeesMaster]
GO
ALTER TABLE [dbo].[tblLeave]  WITH CHECK ADD  CONSTRAINT [FK_tblLeave_tblTypeOfLeave] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[tblTypeOfLeave] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLeave] CHECK CONSTRAINT [FK_tblLeave_tblTypeOfLeave]
GO
ALTER TABLE [dbo].[tblLeaveAssignedByRole]  WITH CHECK ADD  CONSTRAINT [FK_tblLeaveAssignedByRole_tblRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLeaveAssignedByRole] CHECK CONSTRAINT [FK_tblLeaveAssignedByRole_tblRole]
GO
ALTER TABLE [dbo].[tblLeaveAssignedByRole]  WITH CHECK ADD  CONSTRAINT [FK_tblLeaveAssignedByRole_tblTypeOfLeave] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[tblTypeOfLeave] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLeaveAssignedByRole] CHECK CONSTRAINT [FK_tblLeaveAssignedByRole_tblTypeOfLeave]
GO
ALTER TABLE [dbo].[tblLeaveAssignedPerSession]  WITH CHECK ADD  CONSTRAINT [FK_tblLeaveAssignedPerSession_tblEmployeesMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployeesMaster] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLeaveAssignedPerSession] CHECK CONSTRAINT [FK_tblLeaveAssignedPerSession_tblEmployeesMaster]
GO
ALTER TABLE [dbo].[tblLeaveAssignedPerSession]  WITH CHECK ADD  CONSTRAINT [FK_tblLeaveAssignedPerSession_tblTypeOfLeave] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[tblTypeOfLeave] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLeaveAssignedPerSession] CHECK CONSTRAINT [FK_tblLeaveAssignedPerSession_tblTypeOfLeave]
GO
ALTER TABLE [dbo].[tblLeavesOldStock]  WITH CHECK ADD  CONSTRAINT [FK_tblLeavesOldStock_tblEmployeesMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployeesMaster] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLeavesOldStock] CHECK CONSTRAINT [FK_tblLeavesOldStock_tblEmployeesMaster]
GO
USE [master]
GO
ALTER DATABASE [BiometricAttendanceManagementSystem] SET  READ_WRITE 
GO
