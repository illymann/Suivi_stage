USE [LDARCY]
GO
/****** Object:  Table [dbo].[Entreprise]    Script Date: 14/05/2017 12:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entreprise](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Siret] [varchar](20) NULL,
	[Rsocial] [varchar](40) NULL,
	[DomaineActiv] [varchar](40) NULL,
	[Effectif] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fichiers]    Script Date: 14/05/2017 12:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fichiers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOGIN_USER]    Script Date: 14/05/2017 12:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGIN_USER](
	[NOM] [varchar](50) NULL,
	[PRENOM] [varchar](50) NULL,
	[UTILISATEUR] [varchar](50) NULL,
	[MDP] [varchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personnes]    Script Date: 14/05/2017 12:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personnes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumTelephone] [int] NULL,
	[Nom] [varchar](20) NULL,
	[Prenom] [varchar](20) NULL,
	[email] [varchar](20) NULL,
	[Responsable] [bit] NULL,
	[ProfPrincipal] [bit] NULL,
	[Visiteur] [bit] NULL,
	[éleve] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stages]    Script Date: 14/05/2017 12:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[durée] [int] NULL,
	[DateDebut] [date] NULL,
	[DateFin] [date] NULL,
	[Intitulé] [varchar](20) NULL,
	[Thème] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_MON_DES]    Script Date: 14/05/2017 12:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_MON_DES](
	[DES_ID] [int] NULL,
	[DES_Nom] [varchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_UNI_VER]    Script Date: 14/05/2017 12:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_UNI_VER](
	[VER_ID] [int] NULL,
	[VER_Nom] [varchar](8) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Entreprise] ON 

INSERT [dbo].[Entreprise] ([ID], [Siret], [Rsocial], [DomaineActiv], [Effectif]) VALUES (1, N'02536558', N'DarcyEtFils', N'Informatique', 9)
SET IDENTITY_INSERT [dbo].[Entreprise] OFF
INSERT [dbo].[LOGIN_USER] ([NOM], [PRENOM], [UTILISATEUR], [MDP]) VALUES (N'DARCY', N'LIONEL', N'ILLY', N'DARCY')
INSERT [dbo].[LOGIN_USER] ([NOM], [PRENOM], [UTILISATEUR], [MDP]) VALUES (N'NAINTRE', N'YOHAN', N'YOYO', N'NAINTRE')
INSERT [dbo].[LOGIN_USER] ([NOM], [PRENOM], [UTILISATEUR], [MDP]) VALUES (N'Invite', N'invite', N'invit', N'invit')
SET IDENTITY_INSERT [dbo].[Personnes] ON 

INSERT [dbo].[Personnes] ([ID], [NumTelephone], [Nom], [Prenom], [email], [Responsable], [ProfPrincipal], [Visiteur], [éleve]) VALUES (2, 689544578, N'DARCY', N'Lionel', N'illymann@hotmail.com', 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Personnes] OFF
SET IDENTITY_INSERT [dbo].[Stages] ON 

INSERT [dbo].[Stages] ([ID], [durée], [DateDebut], [DateFin], [Intitulé], [Thème]) VALUES (8, 6, CAST(N'2017-11-20' AS Date), CAST(N'2018-04-20' AS Date), N'Evolution d un syst', N'info')
SET IDENTITY_INSERT [dbo].[Stages] OFF
ALTER TABLE [dbo].[Entreprise]  WITH CHECK ADD  CONSTRAINT [Fk_Stage_E] FOREIGN KEY([ID])
REFERENCES [dbo].[Entreprise] ([ID])
GO
ALTER TABLE [dbo].[Entreprise] CHECK CONSTRAINT [Fk_Stage_E]
GO
