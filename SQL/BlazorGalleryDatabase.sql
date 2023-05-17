/****** Object:  Table [dbo].[ActivityLog]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Activity] [nvarchar](40) NOT NULL,
	[Detail] [nvarchar](255) NOT NULL,
	[UserId] [int] NOT NULL,
	[FolderId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ActivityLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaxFolderCount] [int] NOT NULL,
	[MaxStoragePlanFree] [int] NOT NULL,
	[MaxImagesPerFolder] [int] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FolderId] [int] NOT NULL,
	[Error] [nvarchar](255) NOT NULL,
	[Message] [nvarchar](512) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Folder]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Folder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Selected] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Folder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FolderId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FullPath] [nvarchar](255) NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[FileSize] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[RelativePath] [nvarchar](128) NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[EmailAddress] [nvarchar](80) NOT NULL,
	[EmailVerified] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[TotalLogins] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[IsAdmin] [bit] NULL,
	[StorageUsed] [int] NULL,
	[AcceptedTermsOfServiceDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ActivityLog_Delete]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ActivityLog_Delete]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Delete Statement
    Delete From [ActivityLog]

    -- Delete Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[ActivityLog_FetchAll]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ActivityLog_FetchAll]

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [Activity],[CreatedDate],[Detail],[FolderId],[Id],[UserId]

    -- From tableName
    From [ActivityLog]

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[ActivityLog_Find]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ActivityLog_Find]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [Activity],[CreatedDate],[Detail],[FolderId],[Id],[UserId]

    -- From tableName
    From [ActivityLog]

    -- Find Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[ActivityLog_Insert]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ActivityLog_Insert]

    -- Add the parameters for the stored procedure here
    @Activity nvarchar(40),
    @CreatedDate datetime,
    @Detail nvarchar(255),
    @FolderId int,
    @UserId int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Insert Statement
    Insert Into [ActivityLog]
    ([Activity],[CreatedDate],[Detail],[FolderId],[UserId])

    -- Begin Values List
    Values(@Activity, @CreatedDate, @Detail, @FolderId, @UserId)

    -- Return ID of new record
    SELECT SCOPE_IDENTITY()

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[ActivityLog_Update]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ActivityLog_Update]

    -- Add the parameters for the stored procedure here
    @Activity nvarchar(40),
    @CreatedDate datetime,
    @Detail nvarchar(255),
    @FolderId int,
    @Id int,
    @UserId int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Update Statement
    Update [ActivityLog]

    -- Update Each field
    Set [Activity] = @Activity,
    [CreatedDate] = @CreatedDate,
    [Detail] = @Detail,
    [FolderId] = @FolderId,
    [UserId] = @UserId

    -- Update Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Admin_Delete]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Admin_Delete]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Delete Statement
    Delete From [Admin]

    -- Delete Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Admin_FetchAll]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Admin_FetchAll]

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [Id],[MaxFolderCount],[MaxImagesPerFolder],[MaxStoragePlanFree]

    -- From tableName
    From [Admin]

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Admin_Find]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Admin_Find]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [Id],[MaxFolderCount],[MaxImagesPerFolder],[MaxStoragePlanFree]

    -- From tableName
    From [Admin]

    -- Find Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Admin_Insert]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Admin_Insert]

    -- Add the parameters for the stored procedure here
    @MaxFolderCount int,
    @MaxImagesPerFolder int,
    @MaxStoragePlanFree int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Insert Statement
    Insert Into [Admin]
    ([MaxFolderCount],[MaxImagesPerFolder],[MaxStoragePlanFree])

    -- Begin Values List
    Values(@MaxFolderCount, @MaxImagesPerFolder, @MaxStoragePlanFree)

    -- Return ID of new record
    SELECT SCOPE_IDENTITY()

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Admin_Update]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Admin_Update]

    -- Add the parameters for the stored procedure here
    @Id int,
    @MaxFolderCount int,
    @MaxImagesPerFolder int,
    @MaxStoragePlanFree int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Update Statement
    Update [Admin]

    -- Update Each field
    Set [MaxFolderCount] = @MaxFolderCount,
    [MaxImagesPerFolder] = @MaxImagesPerFolder,
    [MaxStoragePlanFree] = @MaxStoragePlanFree

    -- Update Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[ErrorLog_Delete]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ErrorLog_Delete]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Delete Statement
    Delete From [ErrorLog]

    -- Delete Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[ErrorLog_FetchAll]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ErrorLog_FetchAll]

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [CreatedDate],[Error],[FolderId],[Id],[Message],[UserId]

    -- From tableName
    From [ErrorLog]

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[ErrorLog_Find]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ErrorLog_Find]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [CreatedDate],[Error],[FolderId],[Id],[Message],[UserId]

    -- From tableName
    From [ErrorLog]

    -- Find Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[ErrorLog_Insert]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ErrorLog_Insert]

    -- Add the parameters for the stored procedure here
    @CreatedDate datetime,
    @Error nvarchar(255),
    @FolderId int,
    @Message nvarchar(512),
    @UserId int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Insert Statement
    Insert Into [ErrorLog]
    ([CreatedDate],[Error],[FolderId],[Message],[UserId])

    -- Begin Values List
    Values(@CreatedDate, @Error, @FolderId, @Message, @UserId)

    -- Return ID of new record
    SELECT SCOPE_IDENTITY()

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[ErrorLog_Update]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ErrorLog_Update]

    -- Add the parameters for the stored procedure here
    @CreatedDate datetime,
    @Error nvarchar(255),
    @FolderId int,
    @Id int,
    @Message nvarchar(512),
    @UserId int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Update Statement
    Update [ErrorLog]

    -- Update Each field
    Set [CreatedDate] = @CreatedDate,
    [Error] = @Error,
    [FolderId] = @FolderId,
    [Message] = @Message,
    [UserId] = @UserId

    -- Update Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Folder_Delete]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Folder_Delete]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Delete Statement
    Delete From [Folder]

    -- Delete Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Folder_FetchAll]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Folder_FetchAll]

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [CreatedDate],[Id],[Name],[Selected],[UserId]

    -- From tableName
    From [Folder]

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Folder_FetchAllForUserId]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Folder_FetchAllForUserId]

    -- Create @UserId Paramater
    @UserId int


AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [CreatedDate],[Id],[Name],[Selected],[UserId]

    -- From tableName
    From [Folder]

    -- Load Matching Records
    Where [UserId] = @UserId

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Folder_Find]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Folder_Find]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [CreatedDate],[Id],[Name],[Selected],[UserId]

    -- From tableName
    From [Folder]

    -- Find Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Folder_FindByUserIdAndName]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Folder_FindByUserIdAndName]

    -- Create @Name Paramater
    @Name nvarchar(40),


    -- Create @UserId Paramater
    @UserId int


AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [CreatedDate],[Id],[Name],[Selected],[UserId]

    -- From tableName
    From [Folder]

    -- Find Matching Record
    Where [Name] = @Name And [UserId] = @UserId

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Folder_Insert]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Folder_Insert]

    -- Add the parameters for the stored procedure here
    @CreatedDate datetime,
    @Name nvarchar(40),
    @Selected bit,
    @UserId int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Insert Statement
    Insert Into [Folder]
    ([CreatedDate],[Name],[Selected],[UserId])

    -- Begin Values List
    Values(@CreatedDate, @Name, @Selected, @UserId)

    -- Return ID of new record
    SELECT SCOPE_IDENTITY()

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Folder_Update]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Folder_Update]

    -- Add the parameters for the stored procedure here
    @CreatedDate datetime,
    @Id int,
    @Name nvarchar(40),
    @Selected bit,
    @UserId int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Update Statement
    Update [Folder]

    -- Update Each field
    Set [CreatedDate] = @CreatedDate,
    [Name] = @Name,
    [Selected] = @Selected,
    [UserId] = @UserId

    -- Update Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Image_Delete]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Image_Delete]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Delete Statement
    Delete From [Image]

    -- Delete Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Image_FetchAll]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Image_FetchAll]

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [CreatedDate],[FileSize],[FolderId],[FullPath],[Height],[Id],[Name],[RelativePath],[UserId],[Width]

    -- From tableName
    From [Image]

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Image_FetchAllForFolderId]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Image_FetchAllForFolderId]

    -- Create @FolderId Paramater
    @FolderId int


AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [CreatedDate],[FileSize],[FolderId],[FullPath],[Height],[Id],[Name],[RelativePath],[UserId],[Width]

    -- From tableName
    From [Image]

    -- Load Matching Records
    Where [FolderId] = @FolderId

END


-- End Custom Methods

-- Thank you for using DataTier.Net.

GO
/****** Object:  StoredProcedure [dbo].[Image_Find]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Image_Find]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [CreatedDate],[FileSize],[FolderId],[FullPath],[Height],[Id],[Name],[RelativePath],[UserId],[Width]

    -- From tableName
    From [Image]

    -- Find Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Image_Insert]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Image_Insert]

    -- Add the parameters for the stored procedure here
    @CreatedDate datetime,
    @FileSize int,
    @FolderId int,
    @FullPath nvarchar(255),
    @Height int,
    @Name nvarchar(50),
    @RelativePath nvarchar(128),
    @UserId int,
    @Width int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Insert Statement
    Insert Into [Image]
    ([CreatedDate],[FileSize],[FolderId],[FullPath],[Height],[Name],[RelativePath],[UserId],[Width])

    -- Begin Values List
    Values(@CreatedDate, @FileSize, @FolderId, @FullPath, @Height, @Name, @RelativePath, @UserId, @Width)

    -- Return ID of new record
    SELECT SCOPE_IDENTITY()

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Image_Update]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Image_Update]

    -- Add the parameters for the stored procedure here
    @CreatedDate datetime,
    @FileSize int,
    @FolderId int,
    @FullPath nvarchar(255),
    @Height int,
    @Id int,
    @Name nvarchar(50),
    @RelativePath nvarchar(128),
    @UserId int,
    @Width int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Update Statement
    Update [Image]

    -- Update Each field
    Set [CreatedDate] = @CreatedDate,
    [FileSize] = @FileSize,
    [FolderId] = @FolderId,
    [FullPath] = @FullPath,
    [Height] = @Height,
    [Name] = @Name,
    [RelativePath] = @RelativePath,
    [UserId] = @UserId,
    [Width] = @Width

    -- Update Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[User_Delete]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[User_Delete]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Delete Statement
    Delete From [User]

    -- Delete Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[User_FetchAll]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[User_FetchAll]

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [AcceptedTermsOfServiceDate],[Active],[CreatedDate],[EmailAddress],[EmailVerified],[Id],[IsAdmin],[LastLoginDate],[Name],[PasswordHash],[StorageUsed],[TotalLogins],[UserName]

    -- From tableName
    From [User]

END

-- Begin Custom Methods


set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[User_Find]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[User_Find]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [AcceptedTermsOfServiceDate],[Active],[CreatedDate],[EmailAddress],[EmailVerified],[Id],[IsAdmin],[LastLoginDate],[Name],[PasswordHash],[StorageUsed],[TotalLogins],[UserName]

    -- From tableName
    From [User]

    -- Find Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[User_FindByEmailAddress]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[User_FindByEmailAddress]

    -- Create @EmailAddress Paramater
    @EmailAddress nvarchar(80)

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [AcceptedTermsOfServiceDate],[Active],[CreatedDate],[EmailAddress],[EmailVerified],[Id],[IsAdmin],[LastLoginDate],[Name],[PasswordHash],[StorageUsed],[TotalLogins],[UserName]

    -- From tableName
    From [User]

    -- Find Matching Record
    Where [EmailAddress] = @EmailAddress

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[User_FindByUserName]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[User_FindByUserName]

    -- Create @UserName Paramater
    @UserName nvarchar(20)

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [AcceptedTermsOfServiceDate],[Active],[CreatedDate],[EmailAddress],[EmailVerified],[Id],[IsAdmin],[LastLoginDate],[Name],[PasswordHash],[StorageUsed],[TotalLogins],[UserName]

    -- From tableName
    From [User]

    -- Find Matching Record
    Where [UserName] = @UserName

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[User_Insert]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[User_Insert]

    -- Add the parameters for the stored procedure here
    @AcceptedTermsOfServiceDate datetime,
    @Active bit,
    @CreatedDate datetime,
    @EmailAddress nvarchar(80),
    @EmailVerified bit,
    @IsAdmin bit,
    @LastLoginDate datetime,
    @Name nvarchar(50),
    @PasswordHash nvarchar(255),
    @StorageUsed int,
    @TotalLogins int,
    @UserName nvarchar(20)

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Insert Statement
    Insert Into [User]
    ([AcceptedTermsOfServiceDate],[Active],[CreatedDate],[EmailAddress],[EmailVerified],[IsAdmin],[LastLoginDate],[Name],[PasswordHash],[StorageUsed],[TotalLogins],[UserName])

    -- Begin Values List
    Values(@AcceptedTermsOfServiceDate, @Active, @CreatedDate, @EmailAddress, @EmailVerified, @IsAdmin, @LastLoginDate, @Name, @PasswordHash, @StorageUsed, @TotalLogins, @UserName)

    -- Return ID of new record
    SELECT SCOPE_IDENTITY()

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[User_Update]    Script Date: 5/17/2023 4:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[User_Update]

    -- Add the parameters for the stored procedure here
    @AcceptedTermsOfServiceDate datetime,
    @Active bit,
    @CreatedDate datetime,
    @EmailAddress nvarchar(80),
    @EmailVerified bit,
    @Id int,
    @IsAdmin bit,
    @LastLoginDate datetime,
    @Name nvarchar(50),
    @PasswordHash nvarchar(255),
    @StorageUsed int,
    @TotalLogins int,
    @UserName nvarchar(20)

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Update Statement
    Update [User]

    -- Update Each field
    Set [AcceptedTermsOfServiceDate] = @AcceptedTermsOfServiceDate,
    [Active] = @Active,
    [CreatedDate] = @CreatedDate,
    [EmailAddress] = @EmailAddress,
    [EmailVerified] = @EmailVerified,
    [IsAdmin] = @IsAdmin,
    [LastLoginDate] = @LastLoginDate,
    [Name] = @Name,
    [PasswordHash] = @PasswordHash,
    [StorageUsed] = @StorageUsed,
    [TotalLogins] = @TotalLogins,
    [UserName] = @UserName

    -- Update Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
