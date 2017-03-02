BEGIN TRANSACTION
Begin Try
	DECLARE @ResourceType_Id BIGINT;
	DECLARE @Name NVARCHAR(500);
	DECLARE @IsActive BIT; 
	DECLARE @ResourceTypeName NVARCHAR(50);
			
	SET @Name = 'Tierer_Mgt_Tierer_Validation'
	SET @ResourceTypeName ='Label'
	SET @IsActive = 1
	SELECT @ResourceType_Id = Id FROM dbo.ResourceType WHERE Name = @ResourceTypeName 
	IF NOT EXISTS(SELECT Id FROM dbo.Resource WHERE Name = @Name)
	BEGIN
		INSERT INTO [Resource]
		  (Name, ResourceType_Id, IsActive, CreatedDate, CreatedBy)
		VALUES
		  (@Name, @ResourceType_Id, @IsActive,GETDATE(),1)
	END	

	SET @Name = 'Tierer_Mgt_Default_Specialty_TA_Validation'
	SET @ResourceTypeName ='Label'
	SET @IsActive = 1
	SELECT @ResourceType_Id = Id FROM dbo.ResourceType WHERE Name = @ResourceTypeName 
	IF NOT EXISTS(SELECT Id FROM dbo.Resource WHERE Name = @Name)
	BEGIN
		INSERT INTO [Resource]
		  (Name, ResourceType_Id, IsActive, CreatedDate, CreatedBy)
		VALUES
		  (@Name, @ResourceType_Id, @IsActive,GETDATE(),1)
	END	
	
	SET @Name = 'Tierer_Mgt_Default_Specialty_TA'
	SET @ResourceTypeName ='Label'
	SET @IsActive = 1
	SELECT @ResourceType_Id = Id FROM dbo.ResourceType WHERE Name = @ResourceTypeName 
	IF NOT EXISTS(SELECT Id FROM dbo.Resource WHERE Name = @Name)
	BEGIN
		INSERT INTO [Resource]
		  (Name, ResourceType_Id, IsActive, CreatedDate, CreatedBy)
		VALUES
		  (@Name, @ResourceType_Id, @IsActive,GETDATE(),1)
	END	
	
	SET @Name = 'Tierer_Mgt_Specialty'
	SET @ResourceTypeName ='Label'
	SET @IsActive = 1
	SELECT @ResourceType_Id = Id FROM dbo.ResourceType WHERE Name = @ResourceTypeName 
	IF NOT EXISTS(SELECT Id FROM dbo.Resource WHERE Name = @Name)
	BEGIN
		INSERT INTO [Resource]
		  (Name, ResourceType_Id, IsActive, CreatedDate, CreatedBy)
		VALUES
		  (@Name, @ResourceType_Id, @IsActive,GETDATE(),1)
	END	
	
	SET @Name = 'Tierer_Mgt_Specialty_Validation'
	SET @ResourceTypeName ='Label'
	SET @IsActive = 1
	SELECT @ResourceType_Id = Id FROM dbo.ResourceType WHERE Name = @ResourceTypeName 
	IF NOT EXISTS(SELECT Id FROM dbo.Resource WHERE Name = @Name)
	BEGIN
		INSERT INTO [Resource]
		  (Name, ResourceType_Id, IsActive, CreatedDate, CreatedBy)
		VALUES
		  (@Name, @ResourceType_Id, @IsActive,GETDATE(),1)
	END	
	
	SET @Name = 'KOL_TherapeuticArea'
	SET @ResourceTypeName ='Label'
	SET @IsActive = 1
	SELECT @ResourceType_Id = Id FROM dbo.ResourceType WHERE Name = @ResourceTypeName 
	IF NOT EXISTS(SELECT Id FROM dbo.Resource WHERE Name = @Name)
	BEGIN
		INSERT INTO [Resource]
		  (Name, ResourceType_Id, IsActive, CreatedDate, CreatedBy)
		VALUES
		  (@Name, @ResourceType_Id, @IsActive,GETDATE(),1)
	END	
	
	SET @Name = 'KOL_TherapeuticArea_Required'
	SET @ResourceTypeName ='Label'
	SET @IsActive = 1
	SELECT @ResourceType_Id = Id FROM dbo.ResourceType WHERE Name = @ResourceTypeName 
	IF NOT EXISTS(SELECT Id FROM dbo.Resource WHERE Name = @Name)
	BEGIN
		INSERT INTO [Resource]
		  (Name, ResourceType_Id, IsActive, CreatedDate, CreatedBy)
		VALUES
		  (@Name, @ResourceType_Id, @IsActive,GETDATE(),1)
	END	
	
	SET @Name = 'KOL_TherapeuticAreaForHCPProfile'
	SET @ResourceTypeName ='Label'
	SET @IsActive = 1
	SELECT @ResourceType_Id = Id FROM dbo.ResourceType WHERE Name = @ResourceTypeName 
	IF NOT EXISTS(SELECT Id FROM dbo.Resource WHERE Name = @Name)
	BEGIN
		INSERT INTO [Resource]
		  (Name, ResourceType_Id, IsActive, CreatedDate, CreatedBy)
		VALUES
		  (@Name, @ResourceType_Id, @IsActive,GETDATE(),1)
	END	
	

BEGIN	

Declare @VendorId Varchar(50)
Select @VendorId = VendorId from DataUpdateUsers 
where VendorName = 'InfoBeans'

Insert into DataUpdateLog (ZendeskId, ScriptName,VendorId, ExecutedBy, ExecutedDateTime)
Values(NULL,'1 Resource.sql', @VendorId,'Rajendra Kumar Jain', GETDATE())

END


	COMMIT TRANSACTION
	Print 'Transaction Completed'
End Try
Begin Catch
	ROLLBACK TRANSACTION
	Print 'Transaction Rolled Back'
	Select
		 ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage;
End Catch