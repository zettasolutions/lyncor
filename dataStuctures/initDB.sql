
/****** Object:  UserDefinedTableType [dbo].[id_name_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[id_name_tt] AS TABLE(
	[id] [int] NULL,
	[name] [varchar](255) NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[inserted_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[inserted_tt] AS TABLE(
	[inserted_id] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[javascripts_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[javascripts_tt] AS TABLE(
	[js_id] [int] IDENTITY(1,1) NOT NULL,
	[js_url] [nvarchar](100) NULL,
	[js_content] [nvarchar](max) NULL,
	[rev_no] [int] NOT NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_date] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[master_pages_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[master_pages_tt] AS TABLE(
	[master_page_id] [int] NULL,
	[master_page_name] [varchar](50) NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[menus_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[menus_tt] AS TABLE(
	[menu_id] [int] NULL,
	[pmenu_id] [int] NULL,
	[menu_name] [nvarchar](100) NULL,
	[page_id] [int] NULL,
	[seq_no] [int] NULL,
	[is_default] [nvarchar](1) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[month_year_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[month_year_tt] AS TABLE(
	[month_year] [varchar](20) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[page_templates_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[page_templates_tt] AS TABLE(
	[pt_id] [int] NULL,
	[page_id] [int] NOT NULL,
	[pt_content] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[pages_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[pages_tt] AS TABLE(
	[page_id] [int] NULL,
	[page_name] [nvarchar](50) NULL,
	[page_title] [nvarchar](100) NULL,
	[master_page_id] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[role_menus_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[role_menus_tt] AS TABLE(
	[role_menu_id] [int] NULL,
	[role_id] [int] NULL,
	[menu_id] [int] NULL,
	[is_new] [nvarchar](1) NULL,
	[is_write] [nvarchar](1) NULL,
	[is_delete] [nvarchar](1) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[roles_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[roles_tt] AS TABLE(
	[role_id] [int] NULL,
	[role_name] [nvarchar](20) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[select_options_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[select_options_tt] AS TABLE(
	[select_id] [int] NULL,
	[code] [varchar](30) NULL,
	[table_name] [varchar](30) NULL,
	[text] [varchar](50) NULL,
	[value] [varchar](50) NULL,
	[condition_text] [varchar](100) NULL,
	[order_by] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[statuses_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[statuses_tt] AS TABLE(
	[status_id] [int] NULL,
	[status_name] [varchar](50) NULL,
	[color_code] [varchar](50) NULL,
	[color_name] [varchar](50) NULL,
	[seq_no] [int] NULL,
	[is_edit] [varchar](1) NULL,
	[is_active] [varchar](1) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tables_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[tables_tt] AS TABLE(
	[table_id] [int] NULL,
	[table_code] [varchar](50) NULL,
	[table_name] [varchar](50) NULL,
	[table_key_name] [varchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[text_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[text_tt] AS TABLE(
	[text] [varchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[text_value_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[text_value_tt] AS TABLE(
	[text] [varchar](50) NULL,
	[value] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tvi_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[tvi_tt] AS TABLE(
	[text] [varchar](max) NULL,
	[value] [varchar](max) NULL,
	[id] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[users_tt]    Script Date: 4/4/2016 6:16:01 PM ******/
CREATE TYPE [dbo].[users_tt] AS TABLE(
	[user_id] [int] NULL,
	[user_name] [nvarchar](20) NULL,
	[last_name] [nvarchar](100) NULL,
	[first_name] [nvarchar](100) NULL,
	[middle_name] [nvarchar](100) NULL,
	[role_id] [int] NULL,
	[position] [varchar](50) NULL,
	[contact_nos] [varchar](50) NULL,
	[is_contact] [varchar](1) NULL,
	[is_active] [varchar](1) NULL
)
GO

CREATE FUNCTION [dbo].[countRoleMenus] 
(
   @role_id AS INT
)
RETURNS INT
AS
BEGIN   
   DECLARE @retval INT;
     SELECT @retval = COUNT(*)  
       FROM dbo.role_menus WHERE role_id = @role_id;       
   RETURN @retval;
END
GO

CREATE FUNCTION [dbo].[countUsers] 
(
	@role_id			as int
)
RETURNS INT
AS
BEGIN   
   DECLARE @l_retval    INT;
   IF ISNULL(@role_id,0) <> 0
      SELECT @l_retval = COUNT(*) FROM dbo.users WHERE role_id = @role_id
   ELSE
      SELECT @l_retval = COUNT(*) FROM dbo.users

   RETURN @l_retval;
END;

GO

CREATE FUNCTION [dbo].[getAuthNo](
	@user_id int = 0
) 
RETURNS INT
AS
BEGIN
	DECLARE @tt			AS users_tt
	 
	DECLARE @role_id	AS INT
	DECLARE @l_retval	AS INT = 0;

	SELECT @role_id= role_id FROM dbo.users WHERE is_active = 'Y' AND user_id=@user_id
  
	if @role_id IS NOT NULL 
	   SET @l_retval = 1
	       
	if @role_id IS NULL 
	   SET @l_retval = 999

	RETURN @l_retval;
END
go

/****** Object:  UserDefinedFunction [dbo].[getUser]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getUser] 
(
   @user_id        as int
)
RETURNS NVARCHAR(255)
AS
BEGIN   
   DECLARE @l_retval    NVARCHAR(255);

   SELECT @l_retval = last_name + ', ' + first_name FROM dbo.users WHERE user_id = @user_id;

   RETURN @l_retval;
END;


GO

/****** Object:  Table [dbo].[app_profile]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO


CREATE TABLE [dbo].[app_profile](
	[app_title] [varchar](100) NOT NULL,
	[date_format] [varchar](20) NULL,
	[bg_img_path_name] [varchar](100) NULL,
	[excel_conn_str] [varchar](100) NULL,
	[excel_folder] [varchar](100) NULL,
	[image_folder] [varchar](100) NULL,
	[default_page] [varchar](100) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](20) NOT NULL,
	[last_name] [nvarchar](100) NOT NULL,
	[first_name] [nvarchar](100) NOT NULL,
	[middle_name] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[role_id] [int] NULL,
	[is_active] [varchar](1) NULL,
	[is_admin] [varchar](1) NULL,
	[created_by] [int] NULL,
	[created_date] [datetimeoffset](7) NOT NULL,
	[updated_by] [int] NULL,
	[updated_date] [datetimeoffset](7) NOT NULL CONSTRAINT [df_users_created_date]  DEFAULT (sysdatetime()),
	[is_contact] [varchar](1) NULL,
	[contact_nos] [varchar](100) NULL,
	[position] [varchar](50) NULL,
	[img_filename] [varchar](200) NULL,
	[email] [nvarchar](100) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](20) NOT NULL,
	[created_by] [int] NOT NULL,
	[created_date] [datetimeoffset](7) NOT NULL CONSTRAINT [df_roles_created_date]  DEFAULT (sysdatetime()),
	[updated_by] [int] NULL,
	[updated_date] [datetimeoffset](7) NULL
) ON [PRIMARY]

GO


SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[error_logs]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[error_logs](
	[error_id] [int] IDENTITY(1,1) NOT NULL,
	[error_no] [int] NULL,
	[error_msg] [varchar](max) NOT NULL,
	[occurence] [int] NULL,
	[error_type] [varchar](1) NULL,
	[page_url] [varchar](max) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[javascripts]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[javascripts](
	[js_id] [int] IDENTITY(1,1) NOT NULL,
	[page_id] [int] NULL,
	[js_content] [nvarchar](max) NULL,
	[rev_no] [int] NOT NULL CONSTRAINT [df_javascripts_rev_no]  DEFAULT ((0)),
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [pk_javascripts] PRIMARY KEY CLUSTERED 
(
	[js_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[master_pages]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[master_pages](
	[master_page_id] [int] IDENTITY(1,1) NOT NULL,
	[master_page_name] [varchar](50) NULL,
	[created_by] [int] NOT NULL,
	[created_date] [datetimeoffset](7) NOT NULL CONSTRAINT [DF_master_page_created_date]  DEFAULT (getdate()),
	[updated_by] [int] NULL,
	[updated_date] [datetimeoffset](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[menus]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menus](
	[menu_id] [int] IDENTITY(1,1) NOT NULL,
	[pmenu_id] [int] NULL,
	[menu_name] [nvarchar](100) NULL,
	[seq_no] [int] NULL CONSTRAINT [df_menus_seq_no]  DEFAULT ((1)),
	[page_id] [int] NULL,
	[is_default] [varchar](1) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [pk_menus] PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[page_templates]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[page_templates](
	[pt_id] [int] IDENTITY(1,1) NOT NULL,
	[page_id] [int] NULL,
	[pt_content] [nvarchar](max) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [pk_page_templates] PRIMARY KEY CLUSTERED 
(
	[pt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pages]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pages](
	[page_id] [int] IDENTITY(1,1) NOT NULL,
	[page_name] [nvarchar](50) NULL,
	[page_title] [nvarchar](100) NULL,
	[master_page_id] [int] NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [pk_pages] PRIMARY KEY CLUSTERED 
(
	[page_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](20) NOT NULL,
	[created_by] [int] NULL,
	[created_date] [datetimeoffset](7) NOT NULL CONSTRAINT [df_roles_created_date]  DEFAULT (sysdatetime()),
	[updated_by] [int] NULL,
	[updated_date] [datetimeoffset](7) NULL,
 CONSTRAINT [pk_roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[roles_at]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles_at](
	[role_at_id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[modified_by] [int] NOT NULL,
	[modified_date] [datetimeoffset](7) NOT NULL,
	[data_item] [nvarchar](255) NOT NULL,
	[old_value] [nvarchar](255) NULL,
	[new_value] [nvarchar](255) NULL,
 CONSTRAINT [pk_roles_at] PRIMARY KEY CLUSTERED 
(
	[role_at_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[select_options]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[select_options](
	[select_id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](30) NULL,
	[table_name] [varchar](30) NULL,
	[text] [varchar](50) NULL,
	[value] [varchar](50) NULL,
	[condition_text] [varchar](100) NULL,
	[order_by] [varchar](100) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_date] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_ref]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_ref](
	[ref_type] [varchar](10) NULL,
	[ref_value] [varchar](2) NULL,
	[ref_name] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tables]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tables](
	[table_id] [int] IDENTITY(1,1) NOT NULL,
	[table_code] [varchar](50) NULL,
	[table_name] [varchar](50) NULL,
	[table_key_name] [varchar](50) NULL,
	[created_by] [int] NULL,
	[created_date] [datetimeoffset](7) NOT NULL CONSTRAINT [df_tables_created_date]  DEFAULT (sysdatetime()),
	[updated_by] [int] NULL,
	[updated_date] [datetimeoffset](7) NULL,
) ON [PRIMARY]

GO

/****** Object:  View [dbo].[menus_v]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW dbo.user_role_v
AS
SELECT        
 users.user_id
,users.user_name
,users.last_name
,users.first_name
,users.middle_name
,roles.role_name
,users.is_active
,users.role_id
,users.is_contact
,users.contact_nos
,users.position
,users.img_filename
FROM   dbo.users 
	INNER JOIN
       dbo.roles ON dbo.users.role_id = dbo.roles.role_id

go


CREATE VIEW [dbo].[menus_v]
AS
SELECT        dbo.menus.menu_id, dbo.menus.pmenu_id, dbo.menus.menu_name, dbo.menus.seq_no, dbo.menus.page_id, dbo.menus.is_default, dbo.pages.page_name
FROM            dbo.menus LEFT OUTER JOIN
                         dbo.pages ON dbo.menus.page_id = dbo.pages.page_id

GO
/****** Object:  View [dbo].[page_javascripts_v]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[page_javascripts_v]
as
select p.page_name,js.* from dbo.javascripts js inner join dbo.pages p on js.page_id=p.page_id


GO
/****** Object:  View [dbo].[page_templates_v]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[page_templates_v]
as
select p.page_name,pt.* from dbo.page_templates pt inner join dbo.pages p on pt.page_id=p.page_id
GO
/****** Object:  View [dbo].[pages_v]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[pages_v]
AS
SELECT        dbo.pages.page_id, dbo.pages.page_name, dbo.pages.page_title, dbo.master_pages.master_page_id, dbo.master_pages.master_page_name
FROM            dbo.pages INNER JOIN
                         dbo.master_pages ON dbo.pages.master_page_id = dbo.master_pages.master_page_id

GO
/****** Object:  View [dbo].[role_menus_v]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[role_menus_v]
AS
SELECT        dbo.role_menus.role_menu_id, dbo.role_menus.role_id, dbo.role_menus.is_write, dbo.role_menus.is_delete, dbo.menus.menu_id, dbo.menus.pmenu_id, 
                         dbo.menus.menu_name, dbo.menus.seq_no, dbo.menus.is_default, dbo.pages.page_id, dbo.pages.page_name, dbo.pages.page_title, dbo.roles.role_name, 
                         dbo.role_menus.is_new
FROM            dbo.role_menus INNER JOIN
                         dbo.menus ON dbo.role_menus.menu_id = dbo.menus.menu_id INNER JOIN
                         dbo.pages ON dbo.menus.page_id = dbo.pages.page_id INNER JOIN
                         dbo.roles ON dbo.role_menus.role_id = dbo.roles.role_id

GO
/****** Object:  View [dbo].[roles_v]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[roles_v]
AS
SELECT        created_by, created_date, updated_by, updated_date, role_id, role_name
				, dbo.countRoleMenus(role_id) AS countRoleMenus
				, dbo.countUsers(role_id) AS countUsers
FROM            dbo.roles

GO

/****** Object:  View [dbo].[user_role_v]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[user_role_v]
AS
SELECT      
  u.user_id
, u.user_name
, u.last_name
, u.first_name
, u.middle_name
, r.role_name
, u.is_active
, u.role_id
, u.is_contact
, u.img_filename
FROM  dbo.users u INNER JOIN
      dbo.roles r ON u.role_id = r.role_id

GO

ALTER TABLE [dbo].[roles_at]  WITH CHECK ADD  CONSTRAINT [fk_roles_at_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[roles_at] CHECK CONSTRAINT [fk_roles_at_roles]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [fk_user_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [fk_user_roles]
GO
/****** Object:  StoredProcedure [dbo].[app_profile_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[app_profile_sel]
as
select top 1 * from dbo.app_profile

GO
/****** Object:  StoredProcedure [dbo].[app_profile_upd]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[app_profile_upd](
        @app_title			VARCHAR(100)                      
       ,@date_format		VARCHAR(20)
       ,@bg_img_path_name	VARCHAR(100)
	   ,@excel_conn_str		VARCHAR(100)
	   ,@excel_folder		VARCHAR(100)
	   ,@image_folder		VARCHAR(100)
	   ,@default_page		VARCHAR(100)

)
AS 
BEGIN
 
	update dbo.app_profile 
		set
			 app_title			=	@app_title			
			,date_format		=	@date_format		
			,bg_img_path_name	=	@bg_img_path_name
			,excel_conn_str	=		@excel_conn_str		
			,excel_folder		=	@excel_folder		
			,image_folder		=	@image_folder
			,default_page		=	@default_page		
			

END 

 
GO
/****** Object:  StoredProcedure [dbo].[deleteData]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[deleteData]
(
      @pkey_ids     VARCHAR(max)
	 ,@table_code   VARCHAR(50)
	
)
AS
BEGIN
  SET NOCOUNT ON
  DECLARE @stmt							VARCHAR(max); 
  DECLARE @table_name					VARCHAR(50);
  DECLARE @pkey_name					VARCHAR(50);

  SELECT @table_name=table_name,  @pkey_name=table_key_name from tables WHERE table_code = @table_code; 
  SET @stmt = 'DELETE FROM ' +  @table_name + ' WHERE ' + @pkey_name + ' IN (' + REPLACE(@pkey_ids,'/',',') + ')' 
  exec(@stmt);
  RETURN @@ROWCOUNT;
 END;


GO
/****** Object:  StoredProcedure [dbo].[error_logs_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[error_logs_sel]
(
    @error_id  INT = null
   ,@all	   INT = NULL
   ,@user_id INT=NULL
)
AS
BEGIN
	IF(NOT @user_id IS NULL) 
	BEGIN
		SELECT *,dbo.getUser(created_by) as created_by_name,dbo.getUser(updated_by) as updated_by_name 
		FROM error_logs 
		where created_by =@user_id  or updated_by = @user_id 
		order by error_type, updated_date, created_date
		RETURN
	END

	IF NOT @all IS NULL 
			SELECT *,dbo.getUser(created_by) as created_by_name,dbo.getUser(updated_by) as updated_by_name 
			FROM error_logs 
			order by error_type, updated_date, created_date
	ELSE

		SELECT *,dbo.getUser(created_by) as created_by_name,dbo.getUser(updated_by) as updated_by_name FROM error_logs
		WHERE error_id = @error_id;
		
END

 
GO
/****** Object:  StoredProcedure [dbo].[error_logs_upd]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[error_logs_upd](
        @error_no	int=null                      
       ,@error_msg	VARCHAR(max)= NULL   
       ,@error_type	VARCHAR(1)= NULL   
	   ,@page_url	VARCHAR(max)= NULL  
	   ,@user_id	int=0

)
AS 
BEGIN
declare @occurence INT,@error_id int=null;

SET NOCOUNT ON 

	select top 1
			 @occurence=occurence 
			,@error_id=error_id 
			from dbo.error_logs 
				where error_msg = @error_msg and page_url=@page_url
	 
	if(@occurence is null)

			INSERT INTO dbo.error_logs( error_no,error_msg,error_type,occurence,page_url,created_by,created_date) 
			VALUES (@error_no, @error_msg,@error_type,1,@page_url,@user_id,GETDATE())
	else 	 
			UPDATE dbo.error_logs 
			SET 
			  error_no=@error_no
			, error_msg=@error_msg 
			, error_type = @error_type
			, occurence=@occurence + 1
			, page_url=@page_url
			, updated_by =  @user_id
			, updated_date = GETDATE()
			where error_id=@user_id
			  
	
END 


 
GO
/****** Object:  StoredProcedure [dbo].[javascripts_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[javascripts_sel] 
	 @js_id int =null
	,@page_name varchar(50) =null
	,@js_content varchar(50) =null
	,@self_backup int=null
	,@user_id int=0

as
begin
  DECLARE @stmt AS VARCHAR(1000);
 
  SET @stmt = 'select a.*,b.page_name from dbo.javascripts a left join dbo.pages b on a.page_id=b.page_id where 1=1 ';
  
  IF ISNULL(@js_id,0) <> 0
     SET @stmt = @stmt + ' AND a.js_id = ' +  CAST(@js_id AS VARCHAR);

  IF ISNULL(@page_name,'') <> ''
     SET @stmt = @stmt + ' AND lower(b.page_name) = ''' + CAST(lower(@page_name) AS VARCHAR(50)) +  '''';

--     SET @stmt = @stmt + ' AND lower(b.page_name) like ''' + CONCAT('%', lower(@page_name),'%') +  '''';

  IF ISNULL(@js_content,'') <> ''
     SET @stmt = @stmt + ' AND js_content like ''' + CONCAT('%', @js_content,'%') + '''';


  IF NOT @self_backup IS NULL 
	BEGIN
		 
     SET @stmt = @stmt + ' AND a.updated_by=' + CONVERT(varchar(50),@user_id) + ' and not b.page_name like ''%test%'' '
	 SET @stmt = @stmt + ' OR (a.created_by= ' + CONVERT(varchar(50), @user_id) + ' and a.updated_by is null and not b.page_name like ''%test%'')'
	END

     SET @stmt = @stmt + ' order by b.page_name';
  EXEC (@stmt);

END



GO
/****** Object:  StoredProcedure [dbo].[javascripts_upd]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[javascripts_upd](
        @js_id		INT =null                      
       ,@page_id	INT	= NULL   
       ,@js_content	VARCHAR(max)= NULL   
	   ,@new_id		INT OUTPUT 
	   ,@user_id	int =0

)
AS 
BEGIN
declare @rev_no INT =0 
 select @rev_no = ISNULL(rev_no,0)  from javascripts where js_id=@js_id
SET NOCOUNT ON 
	 
	if(isnull(@js_id,0)=0 )
		begin
			INSERT INTO dbo.javascripts( page_id,js_content,rev_no,created_by,created_date) 
			VALUES (@page_id, @js_content,1,@user_id,GETDATE())
			set @new_id	=@@identity
		end
	else
		set @new_id=@js_id
		begin
			UPDATE dbo.javascripts 
			SET 
			  page_id=@page_id
			, js_content=@js_content 
			, rev_no=@rev_no + 1
			, updated_by =  @user_id
			, updated_date = GETDATE()
			where js_id=@js_id
		end	  
	
END 

 
GO
/****** Object:  StoredProcedure [dbo].[master_pages_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[master_pages_sel]
	 @master_page_id int =null
as
BEGIN
	if(@master_page_id IS NOT NULL)
		select * from dbo.master_pages where master_page_id=@master_page_id
	else
		select * from dbo.master_pages
END
 
GO
/****** Object:  StoredProcedure [dbo].[master_pages_upd]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[master_pages_upd]
(
    @tt    master_pages_tt READONLY
   ,@user_id	int=0
)
AS
BEGIN
declare @v varchar(10) = 'zeT@1'
-- Update Process
    UPDATE a 
        SET  master_page_name  = b.master_page_name
            ,updated_by   =@user_id
            ,updated_date = GETDATE()
     FROM dbo.master_pages a INNER JOIN @tt b
        ON a.master_page_id = b.master_page_id 
       AND (
				COALESCE(a.master_page_name,@v) <> COALESCE(b.master_page_name,@v)   
			
	   )

-- Insert Process

    INSERT INTO master_pages (
         master_page_name
        ,created_by
        ,created_date
        )
    SELECT 
        master_page_name
       ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE master_page_id IS NULL
END


 


GO
/****** Object:  StoredProcedure [dbo].[menu_top_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[menu_top_sel]
AS
BEGIN
SELECT * FROM menus WHERE ISNULL(pmenu_id,0)=0 ORDER BY level_no, seq_no;
END
GO
/****** Object:  StoredProcedure [dbo].[menus_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[menus_sel]
(
    @menu_id  INT = null
   ,@pmenu_id INT = NULL
)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);
    SET @stmt = 'SELECT * FROM dbo.menus_v '
    
	IF @menu_id <> '' 
	    SET @stmt = @stmt + ' AND menu_id'+ @menu_id;

    IF @pmenu_id <> ''
	     SET @stmt = @stmt + ' AND menu_id'+ @pmenu_id;

 	SET @stmt = @stmt + ' ORDER BY seq_no';
	exec(@stmt);
 END;


GO
/****** Object:  StoredProcedure [dbo].[menus_upd]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[menus_upd]
(
    @tt    menus_tt READONLY
   ,@user_id int =0
)
AS
-- Update Process
	UPDATE a 
		   SET 
	   	      pmenu_id	   = b.pmenu_id
			 ,menu_name	   = b.menu_name
			 ,page_id	   = b.page_id
	 		 ,seq_no       = b.seq_no
			 ,is_default   = b.is_default
	   	     ,updated_by   = @user_id
			 ,updated_date = GETDATE()
       FROM dbo.menus a INNER JOIN @tt b
	     ON a.menu_id = b.menu_id 
	    AND (
		    isnull(a.pmenu_id,0) <> isnull(b.pmenu_id,0)
		 OR isnull(a.menu_name,'') <> isnull(b.menu_name,'')
		 OR isnull(a.seq_no,0) <> isnull(b.seq_no,0)
		 OR isnull(a.page_id,0) <> isnull(b.page_id,0)
		 OR isnull(a.is_default,'') <> isnull(b.is_default,'')
		 )
-- Insert Process
	INSERT INTO menus (
         menu_name
		,pmenu_id
		,page_id
		,seq_no
		,created_by
		,created_date
    )
	SELECT 
		 menu_name
		,pmenu_id
		,page_id
		,seq_no
	   , @user_id
	   , GETDATE()
	FROM @tt 
	WHERE menu_id IS NULL

GO

/****** Object:  StoredProcedure [dbo].[page_data_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[page_data_sel] 
(
    @page_name  varchar(50)
   ,@user_id  int=0
)
AS
BEGIN
    declare 
		 @page_id int
		,@page_title varchar(100)
		,@pt_id int
		,@pt_content varchar(max)
		,@page_js_rev_no int
		,@zsi_lib_rev_no int
		,@app_start_js_rev_no int
		,@master_page_name varchar(50);

	select 
		 @pt_content=pt.pt_content
		,@pt_id=pt.pt_id
		,@page_id=p.page_id
		,@page_title=p.page_title 
		,@master_page_name = p.master_page_name	
	from dbo.pages_v p 
	left join dbo.page_templates pt on pt.page_id = p.page_id
	where lower(p.page_name) =lower(@page_name)

	--get latest revision no. of Page js
	select @page_js_rev_no=js.rev_no from dbo.pages p inner join dbo.javascripts js on js.page_id = p.page_id
	 where lower(p.page_name) =lower(@page_name)


	--get latest revision no. of zsi_lib js
	 select @zsi_lib_rev_no=js.rev_no from dbo.javascripts js inner join dbo.pages p on js.page_id=p.page_id
	 where lower(p.page_name) = 'zsilib'

	--get latest revision no. of app_start js
	 select @app_start_js_rev_no=js.rev_no from dbo.javascripts js inner join dbo.pages p on js.page_id=p.page_id
	 where lower(p.page_name) = 'appstart'

	 
	--display result
	select	 @page_id as page_id
			,@page_title as page_title
			,@pt_id as pt_id
			,isnull(@pt_content,'') as pt_content
			,isnull(@page_js_rev_no,0) as page_js_rev_no 
			,isnull(@zsi_lib_rev_no,0) as zsi_lib_rev_no 
			,isnull(@app_start_js_rev_no,0) as app_start_js_rev_no
			,isnull(@master_page_name,'') as master_page_name
			,dbo.getUserRole(@user_id) as role		
END

 
GO
/****** Object:  StoredProcedure [dbo].[page_templates_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[page_templates_sel]
	 @pt_id int =null
	,@page_name varchar(50) =null
	,@pt_content varchar(max)=null
	,@self_backup int=null
	,@user_id int=null
as
BEGIN

  IF NOT @self_backup IS NULL
	BEGIN 	
		select a.*,b.page_name,b.page_title from dbo.page_templates a left join dbo.pages b on a.page_id=b.page_id
		WHERE a.updated_by= @user_id and not b.page_name like '%test%' 
		
			OR (a.created_by= @user_id and a.updated_by is null and not b.page_name like '%test%')
		RETURN; 
	END

	if(@pt_id IS NOT NULL)
		select a.*,b.page_name from dbo.page_templates a left join dbo.pages b on a.page_id=b.page_id where pt_id=@pt_id
	else
		BEGIN			
			if(@page_name IS NOT NULL)		 
					select top 1 p.page_name,p.page_title,p.page_id, pt.* from dbo.pages p
					left join  dbo.page_templates pt on pt.page_id = p.page_id
					 where lower(p.page_name) =lower(@page_name)
			ELSE
				BEGIN
					if(@pt_content is not null)
						select a.*,b.page_name from dbo.page_templates a left join dbo.pages b on a.page_id=b.page_id where pt_content like concat('%', @pt_content, '%')
					ELSE
						select a.*,b.page_name,b.page_title from dbo.page_templates a left join dbo.pages b on a.page_id=b.page_id;
				END
		END
END

GO
/****** Object:  StoredProcedure [dbo].[page_templates_upd]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[page_templates_upd](
        @pt_id		INT =null                      
       ,@page_id	INT	= NULL   
       ,@pt_content	VARCHAR(max)= NULL   
	   ,@new_id		INT OUTPUT 
	   ,@user_id	int=null

)
AS 
BEGIN
SET NOCOUNT ON 
	 
	if(isnull(@pt_id,0)=0 )
		begin
			INSERT INTO dbo.page_templates( page_id,pt_content,created_by,created_date) 
			VALUES (@page_id, @pt_content,@user_id, GETDATE())
			set @new_id	=@@identity
		end
	else
		set @new_id=@pt_id
		begin
			UPDATE dbo.page_templates 
			SET 
			  page_id=@page_id
			, pt_content=@pt_content 
			, updated_by = @user_id
			, updated_date = GETDATE()
			where pt_id=@pt_id
		end	  
	
END 


GO
/****** Object:  StoredProcedure [dbo].[pages_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pages_sel]
(
   @page_id  INT = null
   ,@page_name  varchar(50) = null
)
AS
BEGIN
  IF @page_id IS NOT NULL  
	 SELECT * FROM pages_v WHERE page_id = @page_id; 
  IF @page_name IS NOT NULL  
      SELECT * FROM pages_v WHERE page_name = @page_name ORDER BY page_name; 
  ELSE
       SELECT * FROM pages_v ORDER BY page_name;
      
END
GO
/****** Object:  StoredProcedure [dbo].[pages_upd]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pages_upd]
(
    @tt    pages_tt READONLY
   ,@user_id int = 0
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  page_name  = b.page_name
			,page_title  = b.page_title
			,master_page_id  = b.master_page_id
            ,updated_by   = @user_id
            ,updated_date = GETDATE()
     FROM dbo.pages a INNER JOIN @tt b
        ON a.page_id = b.page_id 
       WHERE (
				isnull(a.page_name,'') <> isnull(b.page_name,'')   
			OR  isnull(a.page_title,'') <> isnull(b.page_title,'')   
			OR  isnull(a.master_page_id,0) <> isnull(b.master_page_id,0)   
	   )

-- Insert Process

    INSERT INTO pages (
         page_name
		,page_title
		,master_page_id
        ,created_by
        ,created_date
        )
    SELECT 
        page_name
	   ,page_title
	   ,isnull(master_page_id,2) --default is: _layout
       ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE page_id IS NULL
END



GO
/****** Object:  StoredProcedure [dbo].[role_menus_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[role_menus_sel]
(
   @role_id  INT = null
)
AS
BEGIN
  IF ISNULL(@role_id,0) =0  
     SELECT * FROM role_menus_v ;
  ELSE
      SELECT role_menu_id, role_id, menu_id, menu_name, is_write, is_delete, is_new FROM role_menus_v WHERE role_id = @role_id 
	  UNION
	  SELECT NULL as role_menu_id, null as role_id, menu_id, menu_name, null as is_write, null as is_delete, null as is_new FROM menus a
	    WHERE pmenu_id <> 1 AND is_default='N' AND NOT EXISTS (select menu_id FROM role_menus_v b where b.menu_id = a.menu_id AND b.role_id = @role_id);
END


GO
/****** Object:  StoredProcedure [dbo].[role_menus_upd]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[role_menus_upd]
(
    @tt    role_menus_tt READONLY
   ,@user_id int =0
)
AS
SET NOCOUNT ON
DECLARE @updated_count INT;
-- Update Process

    DELETE FROM dbo.role_menus WHERE role_menu_id IN (SELECT role_menu_id FROM @tt WHERE role_menu_id IS NOT NULL AND role_id IS NULL);

	UPDATE a 
		 SET role_id         = b.role_id
	 	    ,menu_id         = b.menu_id
			,is_new          = b.is_new
	 		,is_write        = b.is_write
			,is_delete       = b.is_delete
	   	    ,updated_by      = @user_id
			,updated_date    = GETDATE()
       FROM dbo.role_menus a INNER JOIN @tt b
	     ON a.role_menu_id = b.role_menu_id 
	    WHERE ((a.role_id <> isnull(b.role_id,0) AND a.menu_id <> isnull(b.menu_id,0))
		     OR a.is_new <> isnull(b.is_new,'') 
			 OR a.is_write <> isnull(b.is_write,'') 
			 OR a.is_delete <> isnull(b.is_delete,'') 
			)

SET @updated_count = @@ROWCOUNT;


-- Insert Process
	INSERT INTO role_menus (
		role_id
		,menu_id
		,is_new
		,is_write
		,is_delete
		,created_by
		,created_date
    )
	SELECT 
		role_id
		,menu_id
		,is_new
		,is_write
		,is_delete
	    , @user_id
	    ,GETDATE()
	FROM @tt 
	WHERE role_menu_id IS NULL
	AND role_id IS NOT NULL AND menu_id IS NOT NULL;

SET @updated_count = @updated_count + @@ROWCOUNT;
RETURN @updated_count;


GO
/****** Object:  StoredProcedure [dbo].[roles_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[roles_sel]
(
   @role_id  INT = null
)
AS
BEGIN
  IF ISNULL(@role_id,0)=0  
     SELECT * FROM roles_v;
  ELSE
      SELECT * FROM roles_v WHERE role_id = @role_id; 
END

GO
/****** Object:  StoredProcedure [dbo].[roles_upd]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[roles_upd]
(
    @tt    roles_tt READONLY
   ,@user_id int=0
)
AS
SET NOCOUNT ON
DECLARE @updated_count INT;
-- Update Process
	UPDATE a 
		 SET role_name         = b.role_name
	   	    ,updated_by        = @user_id
			,updated_date      = GETDATE()
       FROM dbo.roles a INNER JOIN @tt b
	     ON a.role_id = b.role_id 
		WHERE b.role_name IS NOT NULL
	    AND (isnull(a.role_name,'')  <> isnull(b.role_name,'')   )


SET @updated_count = @@ROWCOUNT;

-- Insert Process
	INSERT INTO roles (
		 role_name
		,created_by
		,created_date
    )
	SELECT 
		 role_name
	    ,@user_id
	    ,GETDATE()
	FROM @tt 
	WHERE role_id IS NULL 
	  AND role_name IS NOT NULL;

SET @updated_count = @updated_count + @@ROWCOUNT;
RETURN @updated_count;
GO


/****** Object:  StoredProcedure [dbo].[searchData]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[searchData]
(
    @code			varchar(20)  
   ,@columns		varchar(max)  
   ,@searchColumn   varchar(50)
   ,@searchKeyword	varchar(100)
   ,@where			varchar(max) = ''
)
AS
BEGIN
   DECLARE @table_name     VARCHAR(50)
   DECLARE @table_key_name     VARCHAR(50)
   DECLARE @stmt           VARCHAR(4000);

   SELECT @table_name=table_name,@table_key_name=table_key_name FROM tables  WHERE table_code=@code;

   SET @stmt = 'SELECT top 20 ' + @table_key_name + ',' + @columns +  ' FROM ' +  @table_name  + ' WHERE ' + @searchColumn + ' LIKE ''%' + @searchKeyword + '%'''
   
   IF isnull(@where,'') <> '' 
      SET @stmt = @stmt + ' and ' + @where;

 --   SET @stmt = @stmt + ' ORDER BY len(' + @searchColumn  + '),' + @searchColumn;
    SET @stmt = @stmt + ' ORDER BY ' + @searchColumn;

  exec(@stmt);        

 END
 

GO
/****** Object:  StoredProcedure [dbo].[select_options_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[select_options_sel]
(
               @code AS varchar(50)=null
              ,@param AS varchar(1000)=null
)
AS
BEGIN
	IF @code IS NULL 
		select * from  select_options
	ELSE
		BEGIN				
			DECLARE @stmt		VARCHAR(4000);
			DECLARE @table		VARCHAR(50);
			DECLARE @value		VARCHAR(50);
			DECLARE @text		VARCHAR(50);
			DECLARE @condition	VARCHAR(100);
			DECLARE @order		VARCHAR(50);
			DECLARE @param2		VARCHAR(100);
  
			SELECT @table = table_name
					,@value = value
					,@text  = text
					,@condition = condition_text
					,@order = order_by
			FROM dbo.select_options
			WHERE code=@code;
   
   
			SET @stmt = 'SELECT ' + @value + ' as value, ' +  @text + ' as text FROM ' + @table + ' WHERE 1=1 ';
			IF @condition <> '' 
				SET @stmt = @stmt + ' AND '+ @condition;
   
			IF @param <> ''
			BEGIN
				SET @param2 =  replace(@param, ',' , ' AND ');
				SET @stmt = @stmt + ' AND ' + @param2 ;
			END
   
			IF @order <> ''
				SET @stmt = @stmt + ' ORDER BY ' + @order;

			exec(@stmt);
		END
 END;
GO
/****** Object:  StoredProcedure [dbo].[select_options_upd]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[select_options_upd]
(
    @tt    select_options_tt READONLY
   ,@user_id	int = 0
)
AS
-- Update Process
	UPDATE a 
		 SET code           = b.code          
			,table_name		= b.table_name
			,condition_text	= b.condition_text
			,order_by		= b.order_by
			,text			= b.text
			,value			= b.value
	   	    ,updated_by      = @user_id
			,updated_date    = GETDATE()
       FROM dbo.select_options a INNER JOIN @tt b
	     ON a.select_id = b.select_id
	    WHERE (
			    isnull(a.table_name,'') <> isnull(b.table_name,'')
			 OR isnull(a.code,'') <> isnull(b.code,'')
			 OR isnull(a.text,'') <> isnull(b.text,'')
			 OR isnull(a.value,'') <> isnull(b.value,'')
			 OR isnull(a.condition_text,'') <> isnull(b.condition_text,'')
			 OR isnull(a.order_by,'') <> isnull(b.order_by,'')
			)
			
-- Insert Process
	INSERT INTO select_options (
		 code            
		,table_name	 
		,text		 
		,value		 
		,condition_text	 
		,order_by	 
		,created_by
		,created_date
    )
	SELECT 
		 code            
		,table_name	 
		,text		 
		,value		 
		,condition_text	 
		,order_by	 
	    ,@user_id
	    ,GETDATE()
	FROM @tt 
	WHERE select_id IS NULL

GO



/****** Object:  StoredProcedure [dbo].[selectOptions]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[selectOptions]
(
    @code       varchar(10)  
   ,@param      varchar(1000)=null
)
AS
BEGIN
   DECLARE @table_name     VARCHAR(50)
   DECLARE @text           VARCHAR(50)
   DECLARE @value          VARCHAR(50)  
   DECLARE @condition_text VARCHAR(100);
   DECLARE @order_by       VARCHAR(50);
   DECLARE @and            VARCHAR(100);
   DECLARE @stmt           VARCHAR(4000);

   SELECT @table_name=table_name, @value=value, @text=text, @condition_text=condition_text, @order_by=order_by 
     FROM select_options
   WHERE code=@code;
   
   SET @stmt = 'SELECT ' + @value + ' as value, ' +  @text + ' as text FROM ' +  @table_name + ' WHERE 1=1 ';
   
    IF isnull(@condition_text,'') <> '' 
      SET @stmt = @stmt + ' AND ' + @condition_text;

   IF isnull(@param,'') <> ''
      BEGIN
         SET @and =  REPLACE(@param,',',' AND ');
         SET @stmt = @stmt + ' AND ' + @and;
      END

   IF isnull(@order_by,'') <> ''
      SET @stmt = @stmt + ' ORDER BY ' + @order_by;

  exec(@stmt);        

 END

  

GO
/****** Object:  StoredProcedure [dbo].[tables_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[tables_sel]
(
    @table_id  INT = null
   ,@table_code VARCHAR(50) = NULL

)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);
	SET @stmt = 'SELECT * FROM dbo.tables WHERE 1=1 ';

	IF @table_id <> '' 
	SET @stmt = @stmt + ' AND table_id' + CAST(@table_id AS VARCHAR);

	IF @table_code <> ''
		SET @stmt = @stmt + ' AND table_code'+ @table_code;
    set @stmt = @stmt + ' order by table_code'
	exec(@stmt);
 END;

GO
/****** Object:  StoredProcedure [dbo].[tables_upd]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[tables_upd]
(
    @tt    tables_tt READONLY
   ,@user_id int =0
)
AS
SET NOCOUNT ON;
DECLARE @updated_count INT;
-- Update Process
	UPDATE a 
		 SET  table_code		= b.table_code
		     ,table_name		= b.table_name
	 		 ,table_key_name	= b.table_key_name
			 ,updated_by		= @user_id
       FROM dbo.tables a INNER JOIN @tt b
	     ON a.table_id = b.table_id
	    AND (
			isnull(a.table_code,'') <> isnull(b.table_code,'')
		 OR isnull(a.table_name,'') <> isnull(b.table_name,'')
		 OR isnull(a.table_key_name,'') <> isnull(b.table_key_name,'')
		);

SET @updated_count = @@ROWCOUNT;

-- Insert Process
	INSERT INTO tables (
	 	 table_code
		,table_name
		,table_key_name
		,updated_by
    )
	SELECT 
	     table_code
	 	,table_name
		,table_key_name
		,@user_id
	FROM @tt 
	WHERE table_id IS NULL;


	SET @updated_count = @updated_count + @@ROWCOUNT;
RETURN @updated_count;

GO


/****** Object:  StoredProcedure [dbo].[user_menus_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[user_menus_sel]
(
    @menu_id  INT = null
   ,@pmenu_id INT = NULL
)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);
    SET @stmt = 'SELECT DISTINCT role_id, is_write, is_delete, menu_id, pmenu_id, menu_name, seq_no, is_default, page_id, page_name, page_title FROM dbo.role_menus_v WHERE role_id =' + CAST(dbo.getUserRoleId() AS VARCHAR(20))   + 
				' UNION SELECT '''' as role_id, '''' as is_write, '''' as is_delete, menu_id, pmenu_id, menu_name, seq_no, is_default, page_id, page_name, page_title FROM default_menus_v 
				  UNION SELECT '''' as role_id, '''' as is_write, '''' as is_delete, menu_id, pmenu_id, menu_name, seq_no, is_default, '''' as page_id, '''' as page_name, '''' as page_title FROM dbo.top_menus_v WHERE menu_id NOT IN (SELECT menu_id FROM dbo.default_menus_v)';

 	SET @stmt = @stmt + ' ORDER BY seq_no';
	exec(@stmt);
 END;

      
GO
/****** Object:  StoredProcedure [dbo].[user_page_access]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[user_page_access]
(
  @page_name varchar(max)
)
AS
BEGIN
    SELECT is_new, is_write, is_delete FROM dbo.role_menus_v WHERE page_name = @page_name AND role_id=dbo.getUserRoleId() 
END



GO
/****** Object:  StoredProcedure [dbo].[user_role_access]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[user_role_access]
AS
BEGIN
    SELECT dbo.is_Admin() is_admin FROM dbo.roles_v WHERE role_id=dbo.getUserRoleId() 
END

GO
/****** Object:  StoredProcedure [dbo].[users_sel]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[users_sel]
(
    @user_name varchar(50) = NULL
   ,@is_active varchar(1)='Y'
   ,@role_id INT=null
   ,@col_no INT = 1
   ,@order_no INT = 0
)
AS
BEGIN
  DECLARE @stmt           VARCHAR(4000);

  
--  SET @stmt = 'SELECT * FROM user_role_v WHERE is_active = ''' + CAST(@is_active AS VARCHAR(1)) + ''''; 
  SET @stmt = 'SELECT * FROM users WHERE is_active = ''' + CAST(@is_active AS VARCHAR(1)) + ''''; 

  IF ISNULL(@user_name,'') <>''
      SET @stmt = @stmt + ' AND user_name = ''' + CAST(@user_name AS VARCHAR(50)) + ''''; 
  
  IF ISNULL(@role_id,0) <> 0 
      SET @stmt = @stmt + ' AND role_id = ' + CAST(@role_id AS VARCHAR(20)); 

  SET @stmt = @stmt + ' ORDER BY ' + CAST(@col_no + 1 AS VARCHAR(1)) + ' ' + IIF(@order_no=0,'ASC','DESC'); 
  
  PRINT @stmt;
  exec(@stmt); 
END;

GO
/****** Object:  StoredProcedure [dbo].[users_upd]    Script Date: 4/4/2016 6:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[users_upd]
(
   @tt			users_tt READONLY
   ,@user_id	int =0
)
AS
SET NOCOUNT ON
DECLARE @updated_count INT;
-- Update Process
   UPDATE a 
       SET user_name        = b.user_name 
	      ,last_name    = b.last_name
		  ,first_name   = b.first_name
		  ,middle_name   = b.middle_name
		  ,role_id      = b.role_id
		  ,position     = b.position
		  ,contact_nos  = b.contact_nos
		  ,is_contact   = b.is_contact
          ,is_active    = b.is_active
          ,updated_by   = @user_id
          ,updated_date = GETDATE()
       FROM dbo.users a INNER JOIN @tt b
        ON a.user_id = b.user_id 
       WHERE 
         (
          isnull(a.user_name,'')  <> isnull(b.user_name,'')   
		  OR isnull(a.last_name,'') <> isnull(b.last_name,'')
		  OR isnull(a.first_name,'') <> isnull(b.first_name,'')
		  OR isnull(a.middle_name,'') <> isnull(b.middle_name,'')
		  OR isnull(a.role_id,0) <> isnull(b.role_id,0)
		  OR isnull(a.contact_nos,'') <> isnull(b.contact_nos,'')
		  OR isnull(a.position,'') <> isnull(b.position,'')
		  OR isnull(a.is_contact,'') <> isnull(b.is_contact,'')
          OR isnull(a.is_active,'') <> isnull(b.is_active,'')
         )
     AND b.user_name IS NOT NULL
	 AND b.last_name IS NOT NULL
	 AND b.first_name IS NOT NULL
	 AND b.role_id IS NOT NULL

SET @updated_count = @@ROWCOUNT;

-- Insert Process
   INSERT INTO users (
       user_name
      ,last_name
	  ,first_name
	  ,middle_name
	  ,role_id
	  ,position
	  ,contact_nos
	  ,is_contact
      ,is_active
      ,created_by
      ,created_date
    )
   SELECT 
       user_name
      ,last_name
	  ,first_name
	  ,middle_name
	  ,role_id
	  ,position
	  ,contact_nos
	  ,is_contact
      ,is_active
      ,@user_id
      ,GETDATE()
   FROM @tt 
   WHERE user_id IS NULL
     AND user_name IS NOT NULL
	 AND last_name IS NOT NULL
	 AND first_name IS NOT NULL
	 AND role_id IS NOT NULL

SET @updated_count = @updated_count + @@ROWCOUNT;
RETURN @updated_count;

GO



CREATE FUNCTION [dbo].[getUserRole]( 
  @user_id  int
)
RETURNS VARCHAR(100) 
AS
BEGIN
   DECLARE @l_role_name VARCHAR(100); 
      SELECT @l_role_name = role_name FROM dbo.user_role_v where user_id = @user_id
      RETURN @l_role_name;
END;
go


/*insert data */
/*master pages*/
--truncate table dbo.master_pages
--go
insert into master_pages(master_page_name,created_by) values('_Admin' ,0)
insert into master_pages(master_page_name,created_by) values('_Layout',0)
insert into master_pages(master_page_name,created_by) values('_Source',0)
insert into master_pages(master_page_name,created_by) values('_NoMenu',0)
insert into master_pages(master_page_name,created_by) values('_PopUp' ,0)

--truncate table dbo.select_options
--go
/* data for select options */
insert into select_options(code,table_name,value,text,created_by,created_date) values('masterpages','master_pages','master_page_id','master_page_name',0,getdate())
