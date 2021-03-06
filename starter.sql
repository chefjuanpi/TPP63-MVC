USE [master]
GO
/****** Object:  Database [TPP63-MVC]    Script Date: 2014-07-07 19:30:30 ******/
CREATE DATABASE [TPP63-MVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TPP63-MVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TPP63-MVC.mdf' , SIZE = 5184KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TPP63-MVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TPP63-MVC_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TPP63-MVC] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TPP63-MVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TPP63-MVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TPP63-MVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TPP63-MVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TPP63-MVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TPP63-MVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [TPP63-MVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TPP63-MVC] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TPP63-MVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TPP63-MVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TPP63-MVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TPP63-MVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TPP63-MVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TPP63-MVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TPP63-MVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TPP63-MVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TPP63-MVC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TPP63-MVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TPP63-MVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TPP63-MVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TPP63-MVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TPP63-MVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TPP63-MVC] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TPP63-MVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TPP63-MVC] SET RECOVERY FULL 
GO
ALTER DATABASE [TPP63-MVC] SET  MULTI_USER 
GO
ALTER DATABASE [TPP63-MVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TPP63-MVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TPP63-MVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TPP63-MVC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TPP63-MVC', N'ON'
GO
USE [TPP63-MVC]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2014-07-07 19:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2014-07-07 19:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2014-07-07 19:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2014-07-07 19:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2014-07-07 19:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2014-07-07 19:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[IdAvatar] [int] NULL,
	[Prenom] [varchar](150) NULL,
	[Nom] [varchar](150) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Avatars]    Script Date: 2014-07-07 19:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avatars](
	[IDAvatar] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](50) NULL,
	[Description] [nvarchar](300) NULL,
	[Source] [nvarchar](50) NULL,
 CONSTRAINT [PK_Avatars] PRIMARY KEY CLUSTERED 
(
	[IDAvatar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Scores]    Script Date: 2014-07-07 19:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scores](
	[ScoreID] [int] IDENTITY(1,1) NOT NULL,
	[Score] [int] NOT NULL,
	[TailleJeu] [tinyint] NOT NULL,
	[NiveauDifficulte] [tinyint] NOT NULL,
	[DateScore] [datetime] NULL,
	[UserID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Scores] PRIMARY KEY CLUSTERED 
(
	[ScoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201406251714072_InitialCreate', N'TPP63_MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416592B97EE621BD82D52276983E6867576D1B780966847588952252A9BA0E897F5A19FD45FE850A26EBCE8622BB6532CB088C8E199E170480E8743FFFBF73FE39F9E7CCF78C451EC0664621E8CF64D03133B705CB29C98095DBC796FFEF4E3D75F8DCF1CFFC9F894D31D313A6849E289F94069786C59B1FD807D148F7CD78E823858D0911DF8167202EB707FFF07EBE0C0C200610296618C3F2484BA3E4E3FE0731A101B873441DE55E0602FE6E550334B518D6BE4E33844369E9877B7B7EF8EEEAF3E4D4719AD699C782E023966D85B98062224A0888294C71F633CA3514096B3100A9077F71C62A05B202FC65CFAE392BC6B47F60F5947ACB2610E6527310DFC9E8007475C3396D87C25FD9A85E6407767A063FACC7A9DEA6F625E38382DFA1078A00091E1F1D48B18F1C4BC2A589CC4E135A6A3BCE128833C8F00EE4B107D1E5511F78CCEEDF60A4B3A1CEDB37F7BC634F16812E109C1098D90B767DC2673CFB57FC3CF77C1674C264707F3C5D1FBB7EF9073F4EE7B7CF4B6DA53E82BD0D50AA0E8360A421C816C7851F4DF34AC7A3B4B6C5834ABB4C9B402B60493C234AED0D325264BFA00D3E5F0BD699CBB4FD8C94BB8717D242ECC216844A3043EAF13CF43730F17F556234FF67F03D7C3B7EF06E17A8D1EDD653AF4027F983811CCAB0FD84B6BE30737CCA6576DBCEF39D97914F8ECBB6E5F59EDFD2C48229B7526D092DCA16889695DBAB1551A6F27936650C39B758EBAFBA6CD2495CD5B49CA3AB4CA4CC8596C7A36E4F2BE2CDFCE167712863078A969318D34199CB8558D84B67B4641519ACD4157B321D09DFFF32A78E623D71B6019ECC005FC8F851BF9B8E8E5CF01181D22BD65BE45710CAB80F32B8A1F1A44873F07107D86ED2402E39C51E4872FCEEDF62120F83AF1E7CCE637C76BB0A1B9FB129C239B06D11961ADD6C6BB0CECCF4142CF88738A28FE48ED1C907DDEB97E778041C439B16D1CC7E760CCD89906E05EE78017841E1DF68663CBD3B6DD90A9875C5FED87080BE97D4E5AFA226A0AC91FD190A97C9226512F83A54BBA899A93EA45CD285A45E5647D456560DD24E5947A415382563933AAC1BCBC74848677F352D8DDF7F3D6DBBC756B41458D335821F12F98E0089631E716518A23528E409775631BCE423A7C8CE98BEF4D29A74FC84B8666B5D26C481781E167430ABBFBB32115138A1F5D8779251D0E3F3931C077A2579FABDAE79C20D9A6A743AD9B9B66BE993540375D4EE238B0DD741628C25E3C6851971F7C38A33D8291F5468C8240C7C0D05DB6E54109F4CD148DEA869C620F536C9CD85958708A621B39B21AA1434E0FC1F21D552158190DA90BF79DC4132C1D47AC116287A01866AA4BA83C2D5C62BB21F25AB524B4ECB885B1BE173CC49A531C62C218B66AA20B7375F0830950F01106A54D4363AB6271CD86A8F15A7563DEE6C296E32EC5243662932DBEB3C62EB9FFF62286D9ACB10D1867B34ABA08A00DE46DC340F959A5AB018807975D3350E1C4A43150EE526DC440EB1ADB8281D655F2EA0C343BA2761D7FE1BCBA6BE6593F286F7E5B6F54D7166CB3A68F1D33CDCCF78436145AE04836CFD339ABC44F5471380339F9F92CE6AEAE68220C7C86693D6453FABB4A3FD46A06118DA809B034B416507E0528014913AA8770792CAF513AEE45F480CDE36E8DB07CED17602B36206357AF422B84FA0B53D1383B9D3E8A9E15D6201979A7C34205476110E2E255EF7807A5E8E2B2B262BAF8C27DBCE14AC7F8603428A8C573D52829EFCCE05ACA4DB35D4B2A87AC8F4BB6969604F749A3A5BC33836B89DB68BB92144E410FB7602D15D5B7F081265B1EE928769BA26E6C65F951BC606C6912A9C657280C5DB2AC2456F112639665554DDFCCFA271CF9198665C78ABCA342DA82130D22B4C4422DB00649CFDD28A6A788A23962719EA9E34B64CABD55B3FCE72CABDBA73C88F93E9053B3BFF95DA178715FDB69655784239C43FF7CE6CFA44174C5E8AB9B1B2CCD0D792852C4EDA78197F844EF5EE95B67B777D5F659898C30B604F925F749D295E4E4D615DF6958E42931C81015BECBEAC3A487D0293BF73CABEAD679A37A943C385545D105ACB6366C3A27A6C75089DE61FF916A45789939C55352AA00BCA8274625AB4102ABD47547AD279E5431EB35DD1185EC922AA450D543CA6A0E494DC86AC54A781A8DAA29BA7390B346AAE8726D776445FE48155A51BD02B64266B1AE3BAA22C5A40AACA8EE8E5DE69B884BE80EEF5ADA33CB8ADB5676A85D6FDFD260BCCC7A38CCB657B9BBAF02558A7B62F1DB79098C97EFA42D694F762BDA5216C958CF963418FA55A776E75D5F741A2FEAF598B58BECDAC2DE7491AFC7EB67B12F6A17D2B14E2429B817C73BE11837E647AAF64733D2192B23318D5C8DB0A93FC714FB2346309AFDE14D3D17B3253C27B842C45DE09866C91BE6E1FEC1A1F0F266775EC15871EC788A23A9EE294C7DCC369087451E51643FA048CE8A58E3A548092A059C2F88839F26E69F69ABE33476C1FE4A8BF78C8BF82371FF48A0E22E4AB0F1979CE5394CE67CF3F16A47DF3974D7EAC5EFF759D33DE3268219736CEC0BBA5C6584EBAF1F7A4993355D439A95DF44BCDE09557B74A0441526C4EA6F0CE62E1DE47D412EE5373E7AFAB6AF68CA37046B212ADE090C8537880A75EF0056C1D2BE0170E093A66F00FA7556FD266015D1B4EF015CD21F4C7C0DD07D19CA5B6E71AB519C8836B124A57A6ECDA65E2BB572DB7B939474BDD6449713AB7BC0AD913CBD8265BCB2BCE3C17647455AF160D8DB34ED17CF25DE95F4E132B163BB59C39B4C146EB810FA5FE507EF40469B224367FB59C09BB6355D1477C75329FBE5FAEE98B1F1BCADED67F46EDAD87461DE1D37B65E79BB3B666BDBDA3FB76C699DB7D0AD67E1CA09459ADB18552CB82DCB360B9CC3097F1E8011641E65F638529DD6D59492DAC2B024D133D5E793898CA58923F195289AD9F6EB2BDFF01B3BCB699AD96AB2309B78F3F5BF9137A769E6ADC96DDC467EB032BB5095B3DDB28E35A53FBDA67CE05A4F5AD2CFDB7CD6C6ABF5D794FE3B88526AB3477347FC7AB27D0751C99053A74776AF7CDD0B7B67E5971461FF8EDD6509C17E579160BBB66B1634176411E49BB720514E224468AE30450E6CA927117517C8A650CD62CCE9EBEE346EC76E3AE6D8B92037090D130A5DC6FEDCAB05BC9813D0C43F4D61AECB3CBE09D31F2A19A20B20A6CB62F337E4E7C4F59C42EE73454C4803C1BC0B1ED1656349596477F95C205D07A42310575FE114DD613FF4002CBE2133F48857910DCCEF122F91FD5C46007520ED035157FBF8D445CB08F931C728DBC327D8B0E33FFDF81FB057921E50540000, N'6.1.0-30225')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Facebook', N'1055585736', N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'https://www.google.com/accounts/o8/id?id=AItOawmWoOeMKcU5JdiElIt60iCS7tEZ1H2a9X0', N'a541e4cb-9eb2-4858-9865-af5dca8983fd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [IdAvatar], [Prenom], [Nom]) VALUES (N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d', N'chefjuanpi@yahoo.com', 0, NULL, N'80e7f36a-9a53-41f0-b0d0-f0a379d115ba', NULL, 0, 0, NULL, 0, 0, N'chefjuanpi@yahoo.com', 12, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [IdAvatar], [Prenom], [Nom]) VALUES (N'a541e4cb-9eb2-4858-9865-af5dca8983fd', N'chocolateria.arriba@gmail.com', 0, NULL, N'122a7c6b-e588-4080-b903-fec33a43c17d', NULL, 0, 0, NULL, 0, 0, N'chocolateria.arriba@gmail.com', 10, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [IdAvatar], [Prenom], [Nom]) VALUES (N'c9d753a9-8657-47cf-bca0-40fbb7da3e0a', N'lolo@test.com', 0, N'AI5TzQ2PY9eO5Qyi/ClSl/CyJqc5Om/gK2Wlv5IIlPfzoFyB7rA4+taB3U7TdJQ5tA==', N'a1bde9c9-6e64-412e-9322-61281a7535cb', NULL, 0, 0, NULL, 0, 0, N'lolo', 11, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [IdAvatar], [Prenom], [Nom]) VALUES (N'd606b7b2-8680-4753-84ec-ec250ab3ec10', N'dave@test.com', 0, N'AM8B40dTCDG+MJ4TPG0/Wb4Kr6gS5LUYQes43EyDDOsNwg87MBgSDGhOokdJeuClnA==', N'059004cf-c938-4100-8b04-e188e44f814f', NULL, 0, 0, NULL, 0, 0, N'Dave', 13, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Avatars] ON 

INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (1, N'Bruce Lee', N'Expert en arts Martial;s et attaques à grand vitesse', N'bruce-lee.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (2, N'Destructeur', N'Guerrier ninja avec attacques tres violentes', N'destructeur.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (3, N'Dorami', N'Petit Fille avec pouvoir magiques enormes', N'dorami.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (4, N'Eva 01', N'Perfect union entre le chat et la machine', N'Eva1.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (5, N'Fullmetal Alchemist', N'Maitre magicien de guerre', N'fullmetal-alchemist.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (6, N'Goku', N'Lutteur tres forte, support bien les attacks', N'Goku.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (7, N'Harry Potter', N'Magicien jeune avec attackes de protection', N'Harry-Potter.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (8, N'Iron Man', N'Armoure de fer permet garder le control de la situtauion en toute temps', N'iron-man.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (9, N'Mario', N'Tout un classique!! Pouvoir de feu et etoiles a disposition', N'mario.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (10, N'Metal Gear Solid', N'Soldier prêt a se batter dans la guerre', N'metal-gear-solid.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (11, N'Naruto', N'Ninja avec povoirs espaciauxs, ', N'naruto.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (12, N'One Piece', N'Le pirate plus pettit et forte a le meme temps', N'onepiece.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (13, N'Pink Panter', N'Relax et effective', N'Pink-Panter.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (14, N'Popeye', N'Marinier experimenter avec unpeu d''épînar change a mode invencible', N'popeye.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (15, N'Ryu', N'Guerrier des rues', N'Ryu-street-fighter.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (16, N'Saint Seiya', N'Chevalier du zodiac', N'saint-seiya.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (17, N'Sonic', N'La vitesse en personne', N'sonic.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (18, N'Sponge Bob', N'Gentil, cute et mortel', N'spongebob.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (19, N'Superman', N'Ultra force, et vitesse', N'superman.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (20, N'Mashin Eiyuuden Wataru', N'Robot Guerrier de grand force', N'wataru.jpg')
INSERT [dbo].[Avatars] ([IDAvatar], [Nom], [Description], [Source]) VALUES (21, N'Zelda', N'Guerrier mitique, posede pouvoir magis et attaques especiaux', N'Zelda.jpg')
SET IDENTITY_INSERT [dbo].[Avatars] OFF
SET IDENTITY_INSERT [dbo].[Scores] ON 

INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (2, 6064, 2, 0, CAST(0x0000A36100D700B4 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (3, 1002, 2, 0, CAST(0x0000A36100D7558E AS DateTime), N'a541e4cb-9eb2-4858-9865-af5dca8983fd')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (4, 225, 2, 0, CAST(0x0000A36100DE1F3B AS DateTime), N'a541e4cb-9eb2-4858-9865-af5dca8983fd')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (5, 100, 0, 0, CAST(0x0000A36100DE2AFC AS DateTime), N'a541e4cb-9eb2-4858-9865-af5dca8983fd')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (6, 13408, 2, 0, CAST(0x0000A36100DE32A7 AS DateTime), N'a541e4cb-9eb2-4858-9865-af5dca8983fd')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (7, 64, 2, 0, CAST(0x0000A36100DEB324 AS DateTime), N'a541e4cb-9eb2-4858-9865-af5dca8983fd')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (8, 169, 0, 0, CAST(0x0000A36100DF13D5 AS DateTime), N'a541e4cb-9eb2-4858-9865-af5dca8983fd')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (9, 9, 2, 0, CAST(0x0000A36100E00C77 AS DateTime), N'a541e4cb-9eb2-4858-9865-af5dca8983fd')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (10, 64, 2, 2, CAST(0x0000A36100E07CB5 AS DateTime), N'a541e4cb-9eb2-4858-9865-af5dca8983fd')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (11, 16, 2, 2, CAST(0x0000A36100E1CEEC AS DateTime), N'a541e4cb-9eb2-4858-9865-af5dca8983fd')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (12, 1107, 2, 2, CAST(0x0000A36100E28704 AS DateTime), N'a541e4cb-9eb2-4858-9865-af5dca8983fd')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (13, 13656, 2, 0, CAST(0x0000A36100EB98E8 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (14, 8343, 2, 0, CAST(0x0000A36100EC23B6 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (15, 1052, 2, 0, CAST(0x0000A36100F16CF4 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (16, 36, 2, 0, CAST(0x0000A36100F1AFA8 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (17, 85, 0, 0, CAST(0x0000A36100F1D58C AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (18, 747, 2, 0, CAST(0x0000A36100F223A1 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (19, 2781, 2, 0, CAST(0x0000A36100F273B1 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (20, 5061, 2, 0, CAST(0x0000A36100F2ADE8 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (21, 1686, 2, 0, CAST(0x0000A36100F2F5C0 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (22, 7921, 2, 0, CAST(0x0000A36100F30DD0 AS DateTime), N'a541e4cb-9eb2-4858-9865-af5dca8983fd')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (23, 16202, 2, 0, CAST(0x0000A36100F3A909 AS DateTime), N'c9d753a9-8657-47cf-bca0-40fbb7da3e0a')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (24, 59942, 2, 0, CAST(0x0000A36100F4E329 AS DateTime), N'c9d753a9-8657-47cf-bca0-40fbb7da3e0a')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (25, 291, 0, 3, CAST(0x0000A36100F637A9 AS DateTime), N'c9d753a9-8657-47cf-bca0-40fbb7da3e0a')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (26, 3346, 2, 0, CAST(0x0000A36100F66142 AS DateTime), N'c9d753a9-8657-47cf-bca0-40fbb7da3e0a')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (27, 1353, 2, 0, CAST(0x0000A36100F6784E AS DateTime), N'c9d753a9-8657-47cf-bca0-40fbb7da3e0a')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (28, 3486, 2, 0, CAST(0x0000A36100F6B0F6 AS DateTime), N'c9d753a9-8657-47cf-bca0-40fbb7da3e0a')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (29, 21774, 2, 0, CAST(0x0000A36100FAE8FB AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (30, 6764, 2, 0, CAST(0x0000A36100FC0F6F AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (31, 532, 2, 0, CAST(0x0000A36100FC485D AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (32, 36744, 2, 0, CAST(0x0000A36100FD108D AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (33, 28704, 2, 0, CAST(0x0000A3610102ABFD AS DateTime), N'a541e4cb-9eb2-4858-9865-af5dca8983fd')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (34, 8778, 0, 0, CAST(0x0000A361010FB38F AS DateTime), N'd606b7b2-8680-4753-84ec-ec250ab3ec10')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (35, 361, 2, 0, CAST(0x0000A36101101C7E AS DateTime), N'd606b7b2-8680-4753-84ec-ec250ab3ec10')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (36, 985, 2, 0, CAST(0x0000A3610110317E AS DateTime), N'd606b7b2-8680-4753-84ec-ec250ab3ec10')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (37, 4519, 0, 0, CAST(0x0000A361011039E0 AS DateTime), N'd606b7b2-8680-4753-84ec-ec250ab3ec10')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (38, 586, 0, 3, CAST(0x0000A3610110C402 AS DateTime), N'd606b7b2-8680-4753-84ec-ec250ab3ec10')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (39, 946, 1, 3, CAST(0x0000A3610111532A AS DateTime), N'd606b7b2-8680-4753-84ec-ec250ab3ec10')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (40, 35528, 2, 0, CAST(0x0000A3610130139E AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (41, 89, 2, 0, CAST(0x0000A3610134D806 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (42, 446, 2, 0, CAST(0x0000A3610135137A AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (43, 1246, 2, 0, CAST(0x0000A3610136A651 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (44, 927, 2, 0, CAST(0x0000A3610136F3EA AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (45, 16815, 2, 0, CAST(0x0000A36101377261 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (46, 31462, 2, 0, CAST(0x0000A3610137B959 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (47, 25023, 2, 0, CAST(0x0000A3610137FBFB AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (48, 31553, 2, 0, CAST(0x0000A3610138C7B8 AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
INSERT [dbo].[Scores] ([ScoreID], [Score], [TailleJeu], [NiveauDifficulte], [DateScore], [UserID]) VALUES (49, 5363, 2, 0, CAST(0x0000A36101393EBB AS DateTime), N'8d10afe1-b5f5-4012-b8bc-ec60bab7ed0d')
SET IDENTITY_INSERT [dbo].[Scores] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2014-07-07 19:30:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2014-07-07 19:30:31 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2014-07-07 19:30:31 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 2014-07-07 19:30:31 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2014-07-07 19:30:31 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 2014-07-07 19:30:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Scores] ADD  CONSTRAINT [DF_Table_1_Date]  DEFAULT (getdate()) FOR [DateScore]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Avatars] FOREIGN KEY([IdAvatar])
REFERENCES [dbo].[Avatars] ([IDAvatar])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Avatars]
GO
ALTER TABLE [dbo].[Scores]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
USE [master]
GO
ALTER DATABASE [TPP63-MVC] SET  READ_WRITE 
GO
