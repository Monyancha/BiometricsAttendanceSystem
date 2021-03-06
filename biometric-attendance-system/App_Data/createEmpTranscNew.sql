USE [BiometricAttendanceManagementSystem]
GO
/****** Object:  StoredProcedure [dbo].[spCreateEmployeeTransc]    Script Date: 01-05-2016 16:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		SI
-- Create date: 29thSeptember2015
-- Description:	Creates a new Employee and returns Employee ID of created Employee 
-- =============================================
ALTER PROCEDURE [dbo].[spCreateEmployeeTransc]
	-- Add the parameters for the stored procedure here
	@employeeId bigint,
	@departmentId int,
	@roleId int,
	@contactNumber bigint,
	@isDeleted bit,
	@createdAt datetime,
	@updatedAt datetime,
	@shiftId int,
	@weeklyOffDay int
AS
BEGIN

   SET NOCOUNT ON;

   INSERT INTO dbo.tblEmployees
          ( 
            EmployeeId,
			RoleId,
			DepartmentId,
			ContactNumber,
			CreatedAt,
			UpdatedAt,
			IsDeleted,
			ShiftId,
			WeeklyOffDay
          ) 
     VALUES 
          ( 
            @employeeId,
			@roleId,
			@departmentId,
			@contactNumber,
			@createdAt,
			@updatedAt,
			@isDeleted,
			@shiftId,
			@weeklyOffDay
          ) 
END





