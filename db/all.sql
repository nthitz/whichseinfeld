--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: character; Type: TABLE; Schema: public; Owner: seinfeld; Tablespace: 
--

CREATE TABLE "character" (
    character_id integer NOT NULL,
    name text,
    alternate_id integer
);


ALTER TABLE public."character" OWNER TO seinfeld;

--
-- Name: character_character_id_seq; Type: SEQUENCE; Schema: public; Owner: seinfeld
--

CREATE SEQUENCE character_character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_character_id_seq OWNER TO seinfeld;

--
-- Name: character_character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seinfeld
--

ALTER SEQUENCE character_character_id_seq OWNED BY "character".character_id;


--
-- Name: character_character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seinfeld
--

SELECT pg_catalog.setval('character_character_id_seq', 14914, true);


--
-- Name: episode; Type: TABLE; Schema: public; Owner: seinfeld; Tablespace: 
--

CREATE TABLE episode (
    episode_id integer NOT NULL,
    title text NOT NULL,
    airdate date NOT NULL,
    season integer NOT NULL,
    seasonnumber integer NOT NULL,
    imdbrating real,
    synopsis text,
    production_code integer,
    episode_number integer,
    generated_synopsis text
);


ALTER TABLE public.episode OWNER TO seinfeld;

--
-- Name: episode_episode_id_seq; Type: SEQUENCE; Schema: public; Owner: seinfeld
--

CREATE SEQUENCE episode_episode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.episode_episode_id_seq OWNER TO seinfeld;

--
-- Name: episode_episode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seinfeld
--

ALTER SEQUENCE episode_episode_id_seq OWNED BY episode.episode_id;


--
-- Name: episode_episode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seinfeld
--

SELECT pg_catalog.setval('episode_episode_id_seq', 171, true);


--
-- Name: episode_has_person_in_role; Type: TABLE; Schema: public; Owner: seinfeld; Tablespace: 
--

CREATE TABLE episode_has_person_in_role (
    episode_id integer,
    person_id integer,
    role_id integer,
    character_id integer
);


ALTER TABLE public.episode_has_person_in_role OWNER TO seinfeld;

--
-- Name: person; Type: TABLE; Schema: public; Owner: seinfeld; Tablespace: 
--

CREATE TABLE person (
    person_id integer NOT NULL,
    name text NOT NULL,
    noteable boolean
);


ALTER TABLE public.person OWNER TO seinfeld;

--
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: seinfeld
--

CREATE SEQUENCE person_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_person_id_seq OWNER TO seinfeld;

--
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seinfeld
--

ALTER SEQUENCE person_person_id_seq OWNED BY person.person_id;


--
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seinfeld
--

SELECT pg_catalog.setval('person_person_id_seq', 1333, true);


--
-- Name: role; Type: TABLE; Schema: public; Owner: seinfeld; Tablespace: 
--

CREATE TABLE role (
    role_id integer NOT NULL,
    name text
);


ALTER TABLE public.role OWNER TO seinfeld;

--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: seinfeld
--

CREATE SEQUENCE role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_role_id_seq OWNER TO seinfeld;

--
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seinfeld
--

ALTER SEQUENCE role_role_id_seq OWNED BY role.role_id;


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seinfeld
--

SELECT pg_catalog.setval('role_role_id_seq', 3, true);


--
-- Name: character_id; Type: DEFAULT; Schema: public; Owner: seinfeld
--

ALTER TABLE ONLY "character" ALTER COLUMN character_id SET DEFAULT nextval('character_character_id_seq'::regclass);


--
-- Name: episode_id; Type: DEFAULT; Schema: public; Owner: seinfeld
--

ALTER TABLE ONLY episode ALTER COLUMN episode_id SET DEFAULT nextval('episode_episode_id_seq'::regclass);


--
-- Name: person_id; Type: DEFAULT; Schema: public; Owner: seinfeld
--

ALTER TABLE ONLY person ALTER COLUMN person_id SET DEFAULT nextval('person_person_id_seq'::regclass);


--
-- Name: role_id; Type: DEFAULT; Schema: public; Owner: seinfeld
--

ALTER TABLE ONLY role ALTER COLUMN role_id SET DEFAULT nextval('role_role_id_seq'::regclass);


--
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: seinfeld
--

COPY "character" (character_id, name, alternate_id) FROM stdin;
14389	Miss America Pageant Announcer	\N
14390	Det. Hudson	\N
14391	Karl Farbman	\N
14392	Howie	\N
14393	Newsstand Boy	\N
14394	Michael Barth (George)	\N
14395	Manny	\N
14396	Crew Leader	\N
14397	Reilly	\N
14398	Silvio	\N
14399	Tabachnik	\N
14400	Homeless Guy	\N
14401	Enzo	\N
14402	Artie	\N
14403	Dr. Fein	\N
14404	Fan #2	\N
14405	Dr. Resnick	\N
14406	Luis	\N
14407	Hussein	\N
14408	Sensei	\N
14409	Jake	\N
14410	Angry Guy	\N
14411	Marty	\N
14412	Dr. Wexler	\N
14413	Diner Customer	\N
14414	Man In Car	\N
14415	D.A. Hoyt	\N
14416	Dan	\N
14417	Male Nurse	\N
14418	Mr. Armstrong	\N
14419	Aaron	\N
14420	The Man Hands	\N
14421	Horse Player #2	\N
14422	Banker	\N
14423	Steven Koren	\N
14424	Maitre D'	\N
14425	Kessler	\N
14426	Cosmo Kramer	\N
14427	Kramer	\N
14428	Hanky's Friend	\N
14429	Fan #1	\N
14430	Kimbrough	\N
14431	Teller	\N
14432	Street Tough	\N
14433	Fulton	\N
14434	Parade Goer	\N
14435	TV Announcer	\N
14436	Blind Violinist/Cop	\N
14437	Dr. Berg	\N
14438	Pop	\N
14439	Chaffeur	\N
14440	Seth	\N
14441	Ipswich	\N
14442	Psychiatric Attendant Guarding Door	\N
14443	Maitre' D	\N
14444	Security Agent	\N
14445	Desota	\N
14446	Guillermo	\N
14447	Man in Waiting Room	\N
14448	Crichton	\N
14449	Mr. Lager	\N
14450	Younger Priest	\N
14451	Passenger #1	\N
14452	Mark	\N
14453	Mr. Clotworthy	\N
14454	Rubin	\N
14455	Clayton	\N
14456	Mr. Burns	\N
14457	Naked Man	\N
14458	Brentano's Employee	\N
14459	Dr. Dembrow	\N
14460	John	\N
14461	Marcelino	\N
14462	Poppie	\N
14463	Poppy	\N
14464	Izzy Sr.	\N
14465	Arthur Milano	\N
14466	Bomb Squad Guy	\N
14467	Jerry Seinfeld	\N
14468	McAdam	\N
14469	Harold	\N
14470	Sal	\N
14471	Shop Lifter	\N
14472	Mr. Tuttle	\N
14473	Stadium Announcer	\N
14474	Executive #1	\N
14475	Man in Office	\N
14476	Vendor #1	\N
14477	FBI Man	\N
14478	Friend	\N
14479	Mandel	\N
14480	Movie Patron	\N
14481	Tommy	\N
14482	Sid Luckman	\N
14483	Man in Mercedes	\N
14484	The Photographer	\N
14485	Malcolm	\N
14486	Florist	\N
14487	Castro	\N
14488	Jason 'Stanky' Hanky	\N
14489	Dwayne	\N
14490	Shellbach	\N
14491	Intern	\N
14492	Frank Constanza	\N
14493	Man #1 in Hockey Audience	\N
14494	Fred Yerkes	\N
14495	Slippery Pete	\N
14496	Clarence	\N
14497	Brett	\N
14498	Man fighting with Kramer over newspaper	\N
14499	Customer #1	\N
14500	Aronson	\N
14501	Keith	\N
14502	Chairman	\N
14503	Man #2 on Jerry Set (Kramer Look-Alike)	\N
14504	Player #1	\N
14505	Soup Nazi	\N
14506	Poker Player #2	\N
14507	Car Salesman	\N
14508	Alton Benes	\N
14509	Captain	\N
14510	Tor	\N
14511	Mr. Tanaka	\N
14512	Pinter	\N
14513	'Be Quiet' Guy	\N
14514	Mr. Cohen	\N
14515	Dugan	\N
14516	Dr. Korval	\N
14517	Clicky	\N
14518	Craig	\N
14519	Vegetable Lasagna	\N
14520	Leonard West	\N
14521	Horse Player #1	\N
14522	Kruger	\N
14523	Poker Player #4	\N
14524	Dr. Abbott	\N
14525	The Cook	\N
14526	Glenn	\N
14527	Loud Movie Patron	\N
14528	David Puddy	\N
14529	Pop Lazzari	\N
14530	Grossbard	\N
14531	Mr. Oh	\N
14532	Dr. Strugatz	\N
14533	Phone Guy #1	\N
14534	Detective Udewitz	\N
14535	Karl	\N
14536	Exterminator	\N
14537	Stubs	\N
14538	Bark of the Dog	\N
14539	Officer #1	\N
14540	Alec	\N
14541	Mr. Stevenson	\N
14542	Boy Scout	\N
14543	Mickey Abbott	\N
14544	Mickey	\N
14545	Father Curtis	\N
14546	Morgan	\N
14547	Executive	\N
14548	Ping	\N
14549	Delivery Boy	\N
14550	The Kid	\N
14551	Mr. Heyman	\N
14552	Man on Set	\N
14553	Power Guy	\N
14554	Cousin	\N
14555	Bernie	\N
14556	Nurse	\N
14557	Momma	\N
14558	Mrs. Sokol	\N
14559	Diane	\N
14560	Stewardess	\N
14561	Gail	\N
14562	Sophie	\N
14563	Connie	\N
14564	Cheryl	\N
14565	Monica	\N
14566	Faithy	\N
14567	Ex-Girlfriend	\N
13842	Justin Pitt	\N
13843	Mr. Pitt	\N
13844	Man #1	\N
13845	Mourner	\N
13846	Man	\N
13847	Usher	\N
13848	Gary	\N
13849	Burmese Boy	\N
13850	George	\N
13851	George Costanza	\N
13852	Counter Guy	\N
13853	Doctor	\N
13854	Juror	\N
13855	Rushdie	\N
13856	Dennis	\N
13857	Judge Vandelay	\N
13858	Teen	\N
13859	Repairman	\N
13860	D'Giff	\N
13861	Levitan	\N
13862	Mike	\N
13863	Lt. Coleman	\N
13864	Leapin' Larry	\N
13865	Man #2	\N
13866	Electrician	\N
13867	Bob Saccamano	\N
13868	Cabbie	\N
13869	Dr. Stern	\N
13870	Scott	\N
13871	Man on the Street	\N
13872	Foreign Man	\N
13873	Manager	\N
13874	Cop #2	\N
13875	Carl	\N
13876	Russell	\N
13877	Russell Dalrymple	\N
13878	Eddie	\N
13879	Policeman #1	\N
13880	Shlomo	\N
13881	Foreign Guy	\N
13882	Richie	\N
13883	Jack Klompus	\N
13884	Super	\N
13885	Paramedic	\N
13886	Poker Player #3	\N
13887	Delivery Guy	\N
13888	Vendor #2	\N
13889	Father	\N
13890	George Steinbrenner	\N
13891	Husband	\N
13892	Bouncer	\N
13893	Umpire	\N
13894	Babu's Friend	\N
13895	Kenny	\N
13896	Ron	\N
13897	Bob	\N
13898	Mr. Elinoff	\N
13899	Man on Street	\N
13900	Vincent	\N
13901	Himself	\N
13902	Director	\N
13903	Mr. Green	\N
13904	Mr. Pless	\N
13905	Jean-Paul	\N
13906	Dr. Allenwood	\N
13907	Ticket Man	\N
13908	Stan	\N
13909	Doorman	\N
13910	Beck	\N
13911	Security Guard	\N
13912	Hotel Clerk	\N
13913	Interviewer	\N
13914	Dirt Person #1	\N
13915	Hippie	\N
13916	Dog Guy	\N
13917	Jay Crespi	\N
13918	Jay	\N
13919	Polar Bear	\N
13920	Eulogist	\N
13921	OTB Patron	\N
13922	Joey	\N
13923	Teddy	\N
13924	Butler	\N
13925	Man At Party	\N
13926	Stage Manager	\N
13927	Zubin	\N
13928	Cop	\N
13929	Poker Player #1	\N
13930	Guy With Glasses	\N
13931	Butcher	\N
13932	Man in Party	\N
13933	Man Waiting in Restaurant	\N
13934	Sofa Salesman	\N
13935	Clerk	\N
13936	Man on Sidewalk	\N
13937	Passerby	\N
13938	Man on Bus	\N
13939	Man in Coffee Shop	\N
13940	Man in Bar	\N
13941	Man in Restaurant	\N
13942	Man in Store	\N
13943	Man in Library	\N
13944	Man at Airport	\N
13945	Rider	\N
13946	Man on 'Jerry' Set	\N
13947	Co-Worker	\N
13948	Moviegoer	\N
13949	Chef	\N
13950	Man Walking Into Elevator	\N
13951	Orderly	\N
13952	Beder	\N
13953	Ian	\N
13954	Waiter	\N
13955	Izzy Mandelbaum	\N
13956	Postmaster General Henry Atkins	\N
13957	Client	\N
13958	Wig Master	\N
13959	Landlord	\N
13960	Sid	\N
13961	Partygoer	\N
13962	Al	\N
13963	Walker #2	\N
13964	Boyfriend	\N
13965	Roy	\N
13966	Dad	\N
13967	Attendant #1	\N
13968	Ben	\N
13969	Prisoner	\N
13970	David	\N
13971	Tom Cosley	\N
13972	Man at Shop	\N
13973	Man in Theatre	\N
13974	Man at Bookstore	\N
13975	Pharmacist	\N
13976	Roger	\N
13977	Walter	\N
13978	Other Walter	\N
13979	Arnie	\N
13980	Reader Behind Elaine	\N
13981	Passenger	\N
13982	Ken	\N
13983	Vic	\N
13984	Co-worker	\N
13985	Fred	\N
13986	Captain Maddox	\N
13987	Maitre d'	\N
13988	Rick	\N
13989	Elaine's Co-Worker	\N
13990	Comedy Club Emcee	\N
13991	Fire Station Speaker	\N
13992	Theatre Announcer	\N
13993	Brian	\N
13994	Stinky Man	\N
13995	Unresponsive Man	\N
13996	Man on Raft #2	\N
13997	Angry Man	\N
13998	Director on 'Jerry' Set	\N
13999	Owner	\N
14000	Steve	\N
14001	Man #3	\N
14002	Co-Worker #1	\N
14003	Lew	\N
14004	Haarwood	\N
14005	Comedy Club Waiter	\N
14006	Gino	\N
14007	Joel	\N
14008	Phone Guy #2	\N
14009	Leader	\N
14010	Policeman	\N
14011	Earl	\N
14012	Earl Haffler	\N
14013	Sketch Guy	\N
14014	Ray	\N
14015	Darryl	\N
14016	Answering Machine	\N
14017	Tony	\N
14018	Truck Driver	\N
14019	Radio Announcer/TV announcer	\N
14020	Tim Whatley	\N
14021	Maxwell	\N
14022	Joe	\N
14023	Joe Davola	\N
14024	'Crazy' Joe Davola	\N
14025	Farkus	\N
14026	Dr. Cooperman	\N
14027	Policeman #2	\N
14028	Gardner	\N
14029	Todd	\N
14030	Priest	\N
14031	Man in Corvette	\N
14032	Driver	\N
14033	Kosher Meal Passenger	\N
14034	The Car Thief	\N
14035	Man at Table	\N
14036	Man with Cape	\N
14037	Subway Announcer	\N
14038	Saddam Hussein	\N
14039	George Steinbrenner/Prisoner	\N
14040	Comedy Club M.C.	\N
14041	Newstand Owner	\N
14042	Screaming B-movie Actor	\N
14043	Sports Commentator/Limo Dispatcher	\N
14044	Man on Beach	\N
14045	Character in Checkmate	\N
14046	Boxing Referee on TV	\N
14047	Heckler	\N
14048	Office Worker	\N
14049	John F. Kennedy Jr./Man on Raft #1	\N
14050	Offstage Voice	\N
14051	Airport Announcer	\N
14052	Newman	\N
14053	Soap Opera Director	\N
14054	Man at Softball Game	\N
14055	Police Officer	\N
14056	MacKenzie	\N
14057	Dry Cleaner	\N
14058	Wyck	\N
14059	Salesman	\N
14060	Larry	\N
14061	Alec Berg	\N
14062	Kevin	\N
14063	Son	\N
14064	Bobby	\N
14065	Restaurateur	\N
14066	Buckles	\N
14067	Stagehand	\N
14068	Lou	\N
14069	James' Telephone Voice	\N
14070	Customer	\N
14071	Mel	\N
14072	Mel Sanger	\N
14073	Guard	\N
14074	Teacher	\N
14075	Izzy Mandelbaum Jr.	\N
14076	Cop #1	\N
14077	Fan #3	\N
14078	Businessman	\N
14079	Buddy	\N
14080	Man with Cane	\N
14081	Bodybuilder	\N
14082	Mr. Reichman	\N
14083	Bailiff	\N
14084	Mr. Pensky	\N
14085	Mr. Lippman	\N
14086	Lippman	\N
14087	Mr. Breckman	\N
14088	Judge	\N
14089	Man with Woman	\N
14090	Stand Owner	\N
14091	Clown	\N
14092	Man at Counter	\N
14093	Man Outside Stadium	\N
14094	Joe Mayo	\N
14095	Gregg	\N
14096	Jack	\N
14097	Dentist	\N
14098	Charles	\N
14099	Attendant	\N
14100	Kicker	\N
14101	Harry	\N
14102	The Flying Sandos Brothers	\N
14103	NBC Executive	\N
14104	Mailman	\N
14105	Bldg 'C'	\N
14106	Brendan	\N
14107	Isaac	\N
14108	Punk #2	\N
14109	Guy On Phone	\N
14110	Mr. Ross	\N
14111	Newscaster	\N
14112	Tough Guy	\N
14113	Alan	\N
14114	Man in Sombrero	\N
14115	Jaime	\N
14116	Smoker	\N
14117	Resident	\N
14118	Babu Bhatt	\N
14119	Babu	\N
14120	Uncle Mac	\N
14121	Cab Driver	\N
14122	Receptionist	\N
14123	Simon	\N
14124	Letter S in Devils Body Painter	\N
14125	Lyle	\N
14126	Tenant #2	\N
14127	Bystander #2	\N
14128	Johnny	\N
14129	Jiffy Dump Guy	\N
14130	Jiffy Park Guy	\N
14131	Male Executive	\N
14132	Brody	\N
14133	Protester #2	\N
14134	Cushman	\N
14135	Hobo Joe	\N
14136	Misha	\N
14137	Frankie	\N
14138	Matthew	\N
14139	Ukranian	\N
14140	Counterperson	\N
14141	Hal	\N
14142	Postal Official	\N
14143	Baseball Fan	\N
14144	McMaines	\N
14145	Homeless Man	\N
14146	Rusty	\N
14147	Martin	\N
14148	Man Brushing Hair at YMCA	\N
14149	Man at Restaurant	\N
14150	Walker #1	\N
14151	Rudy	\N
14152	Young Man	\N
14153	Bookman	\N
14154	Lt. Bookman	\N
14155	Vet	\N
14156	Gendason	\N
14157	Babu's Brother	\N
14158	Tom Pepper (Kramer)	\N
14159	Married Couple in Diner	\N
14160	Milos	\N
14161	Ralph	\N
14162	Man at Jiffy Park	\N
14163	Man on Phone	\N
14164	Tim	\N
14165	Donald	\N
14166	Bubble Boy	\N
14167	Man in Other Bed	\N
14168	Bizarro George	\N
14169	Tom	\N
14170	Man in Cafe	\N
14171	Man in 'Jerry' Audience	\N
14172	PBS Phone Volunteer	\N
14173	Wilhelm	\N
14174	Car Thief	\N
14175	Mr. Cross	\N
14176	Kurt	\N
14177	Greeny	\N
14178	Tennis Crowd	\N
14179	Ellis	\N
14180	Guy in Diner	\N
14181	Bruce	\N
14182	Joe Temple	\N
14183	Calvin	\N
14184	Farmer	\N
14185	Blind Man	\N
14186	Bania	\N
14187	Music Guy	\N
14188	Ronnie	\N
14189	Employee	\N
14190	Pool Guy	\N
14191	Ramon	\N
14192	Officer Vogel	\N
14193	Jimmy	\N
14194	Maurice	\N
14195	Horst	\N
14196	Mooney	\N
14197	Auctioneer	\N
14198	Officer Phelps	\N
14199	Blaine	\N
14200	Dirt Person #2	\N
14201	Criminal	\N
14202	Mr. Bevilaqua	\N
14203	Watkins	\N
14204	Man in Bakery	\N
14205	Lamar	\N
14206	Thomassoulo	\N
14207	Mr. Thomassoulo	\N
14208	Willie	\N
14209	Postman	\N
14210	Husband on Pier	\N
14211	Protestor #1	\N
14212	Barry	\N
14213	Child	\N
14214	Mr. Canterman	\N
14215	Michael	\N
14216	Mr. Deensfrei	\N
14217	Deensfrei	\N
14218	Intervenor	\N
14219	Lloyd	\N
14220	Businessman #2	\N
14221	On-set DOP	\N
14222	Frank	\N
14223	Officer #2	\N
14224	Bizarro Kramer	\N
14225	Student #1	\N
14226	Ned	\N
14227	The Mother	\N
14228	Ricky's Boss	\N
14229	Guy in Police Lineup	\N
14230	Kid	\N
14231	Steve Koren	\N
14232	Bag Guy	\N
14233	Biker	\N
14234	Man #2 in Hockey Audience	\N
14235	Lab Technician	\N
14236	Older Priest	\N
14237	Kernis	\N
14238	Antonio	\N
14239	Cameo	\N
14240	Herb	\N
14241	Man on Pier	\N
14242	Man in Car	\N
14243	Detective	\N
14244	Greg	\N
14245	Bizarro Newman	\N
14246	Assistant	\N
14247	Minkler	\N
14248	Grandpa	\N
14249	Thug	\N
14250	Skycap	\N
14251	Boss	\N
14252	Mr. Moviefone	\N
14253	Conrad	\N
14254	Crowd Member	\N
14255	Fireman	\N
14256	The 'Shusher'	\N
14257	Man at Protest	\N
14258	Uncle Leo	\N
14259	Leo	\N
14260	Raymond	\N
14261	Counterguy	\N
14262	Mohel	\N
14263	Stationer	\N
14264	Andy	\N
14265	Man in Hansom Cab	\N
14266	Man in Church	\N
14267	Billy	\N
14268	Clyde	\N
14269	Zeke	\N
14270	Bill	\N
14271	The Other Guy	\N
14272	Ricky	\N
14273	Hippie #1	\N
14274	The Freak	\N
14275	Party Guest	\N
14276	Gary Fogel	\N
14277	Stock Boy	\N
14278	Dustin	\N
14279	Gavin	\N
14280	Rabbi	\N
14281	Rabbi Glickman	\N
14282	Robert	\N
14283	Ball Boy	\N
14284	Adam	\N
14285	Sleazy Guy	\N
14286	Twitching Patient	\N
14287	Larry The Cook	\N
14288	Manager/Monk's	\N
14289	Larry, Owner of Monk's	\N
14290	Sailor	\N
14291	Student #2	\N
14292	Willie, Sr.	\N
14293	Health Inspector	\N
14294	Gepetto	\N
14295	Paul	\N
14296	Man at Bar	\N
14297	Guy	\N
14298	Morty	\N
14299	Morty Seinfeld	\N
14300	Man in Elevator	\N
14301	Father Hernandez	\N
14302	Interpreter	\N
14303	Car Washer	\N
14304	Co-Worker #2	\N
14305	Leland	\N
14306	Lloyd Braun	\N
14307	Don	\N
14308	Denim Vest	\N
14309	Player #2	\N
14310	Jesse	\N
14311	Mr. Star	\N
14312	Dr. Reston - the Psychiatrist	\N
14313	Psychiatrist	\N
14314	Dr. Reston	\N
14315	Man in Video Store	\N
14316	Delivery Man	\N
14317	Bartender	\N
14318	Customer Being Robbed	\N
14319	TMI Long Distance Operator	\N
14320	Mitch	\N
14321	Duncan	\N
14322	James	\N
14323	Jeff	\N
14324	FDR	\N
14325	Julio	\N
14326	Man in Barber Shop	\N
14327	Smelly Passenger	\N
14328	Man at Rehearsal	\N
14329	Officer	\N
14330	Furniture Guy	\N
14331	The Maestro	\N
14332	Maestro	\N
14333	Ciccio	\N
14334	Neil	\N
14335	Event Guard	\N
14336	Man in Lift	\N
14337	Murder One!	\N
14338	Mr. Yamaguchi	\N
14339	Businessman #1	\N
14340	Phone Guy	\N
14341	Photographer	\N
14342	Amigo	\N
14343	Punk #1	\N
14344	Studio Guard	\N
14345	Mr. Parry	\N
14346	Jackie Chiles	\N
14347	Father Jessup	\N
14348	Lomez Jr.	\N
14349	Spike	\N
14350	Lubeck	\N
14351	Timmy	\N
14352	Testikov	\N
14353	Lt. Martel	\N
14354	Mets Broadcaster	\N
14355	Office Manager	\N
14356	Phil	\N
14357	Dick	\N
14358	Hairdresser	\N
14359	Old Man	\N
14360	Reporter	\N
14361	The Chiropractor	\N
14362	Patient	\N
14363	Man in Line	\N
14364	Airport Security Guy	\N
14365	Young Cop	\N
14366	Night Doorman	\N
14367	Gus	\N
14368	Vendor	\N
14369	J. Peterman	\N
14370	Peterman	\N
14371	Det. Blake	\N
14372	Officer Morgan	\N
14373	Wilton	\N
14374	Nick	\N
14375	The Drake	\N
14376	Stu Chermak	\N
14377	Stu	\N
14378	Stu Chermack	\N
14379	Don Tyler	\N
14380	On-set Crew	\N
14381	Cedric	\N
14382	Country Doctor	\N
14383	Darin	\N
14384	Mr. Goldstein	\N
14385	Owen	\N
14386	Zach	\N
14387	Detective Danner	\N
14388	Newsstand Owner	\N
14568	Ava	\N
14569	Saleswoman	\N
14570	Woman	\N
14571	Woman At Party	\N
14572	Alice	\N
14573	Waitress	\N
14574	Female Executive	\N
14575	Trucker	\N
14576	Mom	\N
14577	Stephanie	\N
14578	Herself	\N
14579	Mrs. Choate	\N
14580	Mabel	\N
14581	Ticket Clerk #2	\N
14582	Makeup Artist	\N
14583	Woman #1	\N
14584	Mrs. Ricardi	\N
14585	Celia	\N
14586	Woman on Phone	\N
14587	Roberta	\N
14588	Murphy Brown	\N
14589	Leslie	\N
14590	Anna	\N
14591	Therapist	\N
14592	Walker #3	\N
14593	Flower Girl	\N
14594	Louise	\N
14595	Mail Clerk	\N
14596	Blonde Longhaired Woman	\N
14597	Waitress #1	\N
14598	Woman #2	\N
14599	Lady in Restaurant	\N
14600	Woman #3	\N
14601	Customer in Coffeeshop	\N
14602	Woman in Bette Midler Entourage	\N
14603	Laura	\N
14604	Secretary	\N
14605	Mah-Jongg Lady	\N
14606	Maryedith	\N
14607	Mother	\N
14608	Woman on 'Jerry' Set	\N
14609	Sheila	\N
14610	Tia	\N
14611	Lisi	\N
14612	Tawni	\N
14613	Mrs. Nyhart	\N
14614	Mrs. Allister	\N
14615	Tammy	\N
14616	Mrs. Zanfino	\N
14617	Sylvia	\N
14618	Kramer's Girlfriend	\N
14619	Housekeeper	\N
14620	Woman Exec.	\N
14621	Robin	\N
14622	Charmaine	\N
14623	Lotus	\N
14624	Vanessa	\N
14625	Alex	\N
14626	Cashier	\N
14627	Old Lady	\N
14628	Ruthie Cohen	\N
14629	Ruthie	\N
14630	Peggy	\N
14631	Allison	\N
14632	Jodi	\N
14633	Meryl	\N
14634	Toby	\N
14635	Mrs. Canterman	\N
14636	Cynthia	\N
14637	Becky	\N
14638	Sara	\N
14639	Model #2	\N
14640	Marcy	\N
14641	Glenda	\N
14642	Woman at Mailbox	\N
14643	Bldg 'B'	\N
14644	Jenna	\N
14645	Mona	\N
14646	The Drakette	\N
14647	Kobe	\N
14648	Kissing Girl	\N
14649	Agency Rep	\N
14650	Salesperson	\N
14651	Audrey	\N
14652	Donna Chang	\N
14653	Loretta	\N
14654	Lydia	\N
14655	Rebecca DeMornay	\N
14656	Rebecca	\N
14657	Karen	\N
14658	Ticket Clerk	\N
14659	Myra	\N
14660	Woman in Cafe	\N
14661	Michele	\N
14662	Lola	\N
14663	Tina	\N
14664	Mrs. Burns	\N
14665	Cindy	\N
14666	Miranda	\N
14667	Mrs. Payton	\N
14668	Gwen	\N
14669	Jenny	\N
14670	Ms. Wilkie	\N
14671	Julie	\N
14672	Buxom Woman	\N
14673	Customer #2	\N
14674	Service Assistant	\N
14675	Gina	\N
14676	Marion	\N
14677	Claire	\N
14678	Jeannie	\N
14679	Woman With Elaine	\N
14680	Pam	\N
14681	Margaret	\N
14682	Donna	\N
14683	Carol	\N
14684	Jane	\N
14685	Organizer	\N
14686	Mrs. Hamilton	\N
14687	Paula	\N
14688	Tall Woman	\N
14689	Valerie	\N
14690	Sobbing Theatre Patron	\N
14691	Sally	\N
14692	Winona	\N
14693	PBS Telethon Producer	\N
14694	Evelyn	\N
14695	Amy	\N
14696	Katy	\N
14697	Lena	\N
14698	Madeline	\N
14699	Sister Roberta	\N
14700	Old Woman	\N
14701	Woman in Theatre	\N
14702	Manya	\N
14703	Julianna	\N
14704	Melissa	\N
14705	Stella	\N
14706	Estelle Constanza	\N
14707	Monk's Diner Patron	\N
14708	Sidra	\N
14709	Woman Behind Elaine	\N
14710	Dana	\N
14711	Dana Foley	\N
14712	Marie	\N
14713	Lindsay	\N
14714	Sandy	\N
14715	Kim	\N
14716	Lisa	\N
14717	Carrie	\N
14718	Maura	\N
14719	Lorraine	\N
14720	Sasha	\N
14721	Roxanne	\N
14722	The Waitress	\N
14723	Mrs. Stevenson	\N
14724	Todd's Mother	\N
14725	Mrs. Armstrong	\N
14726	Renee	\N
14727	Betsy	\N
14728	Susie	\N
14729	Dean Jones	\N
14730	Heather	\N
14731	Corinne	\N
14732	Sandi	\N
14733	Mrs. Lupchek	\N
14734	Counterwoman	\N
14735	Counter Woman	\N
14736	Deena	\N
14737	Nina	\N
14738	Model	\N
14739	Woman in Restaurant	\N
14740	Bystander	\N
14741	Tara	\N
14742	Isabel	\N
14743	Judy Dame	\N
14744	Marlene	\N
14745	Kelly	\N
14746	Rava	\N
14747	Passenger #2	\N
14748	Doris	\N
14749	Stacy	\N
14750	Cathy	\N
14751	Card Player	\N
14752	Waitress #2	\N
14753	Bystander #1	\N
14754	Abby	\N
14755	Patti	\N
14756	Marla	\N
14757	Barbara - Bank Employee	\N
14758	Relative	\N
14759	Volunteer	\N
14760	Joyce	\N
14761	Dinner Guest	\N
14762	Ada	\N
14763	Rula	\N
14764	Hostess	\N
14765	Patty	\N
14766	Elaine Benes	\N
14767	Customer #3	\N
14768	Worker	\N
14769	Ruby	\N
14770	Naomi	\N
14771	Katya	\N
14772	Patrice	\N
14773	Gladys	\N
14774	Wife	\N
14775	Wendy	\N
14776	Sandra	\N
14777	Clarisse	\N
14778	Sharon	\N
14779	Lucy	\N
14780	Jennie MacLaine	\N
14781	Melanie	\N
14782	Prostitute	\N
14783	Elsa	\N
14784	Post Office Customer	\N
14785	Mrs. Oliver	\N
14786	Coco	\N
14787	Janine	\N
14788	Angela	\N
14789	Alison	\N
14790	The Nurse	\N
14791	Low-Talker	\N
14792	Concessionaire	\N
14793	Make-up Lady	\N
14794	Beth	\N
14795	Gennice	\N
14796	Ellen	\N
14797	Mrs. Reichman	\N
14798	Chelsea	\N
14799	Mrs. Sweedler	\N
14800	Noel	\N
14801	Server	\N
14802	Woman on Beach	\N
14803	Girl	\N
14804	Sheri	\N
14805	Model #3	\N
14806	Rita	\N
14807	Executive #2	\N
14808	Janet	\N
14809	Mrs. Enright	\N
14810	Ms. Jordan	\N
14811	Danielle	\N
14812	Ms. Baines	\N
14813	Babs	\N
14814	Woman on Pier	\N
14815	Chambermaid	\N
14816	Noreen	\N
14817	Model #1	\N
14818	Lanette	\N
14819	Joanne	\N
14820	Victoria	\N
14821	German Woman	\N
14822	Arlene	\N
14823	Lois	\N
14824	Tiffany	\N
14825	Dental Assistant	\N
14826	Janice	\N
14827	Dental Patient	\N
14828	Mary	\N
14829	Sunny	\N
14830	Molly	\N
14831	Woman Hailing Cab	\N
14832	Keri	\N
14833	Zach's Girlfriend	\N
14834	Ticket Clerk #1	\N
14835	Woman in Bar	\N
14836	Katie	\N
14837	Tenant #1	\N
14838	Denise	\N
14839	Joan	\N
14840	Ms. Smoth	\N
14841	Susie, the Farmer's Daughter	\N
14842	Siena	\N
14843	Sam	\N
14844	Tour Leader	\N
14845	Helen	\N
14846	Helen Seinfeld	\N
14847	Usha	\N
14848	Evie (Cleaning Woman)	\N
14849	Emily	\N
14850	Woman at Monk's	\N
14851	Becky Gelke	\N
14852	Rachel	\N
14853	Hallie	\N
14854	Eva	\N
14855	Mary Anne	\N
14856	Barbara	\N
14857	Mrs. Abbott	\N
14858	Kristin	\N
14859	Woman in Diner	\N
14860	Bldg 'A'	\N
14861	Aunt May	\N
14862	Scam Woman	\N
14863	Landis	\N
14864	Sue Ellen	\N
14865	Nancy	\N
14866	Susan Ross	\N
14867	Shelly	\N
14868	1st AD	\N
14869	Sherry Becker	\N
14870	Woman in Exercise Video	\N
14871	Clara	\N
14872	Daphne	\N
14873	Attractive Applicant	\N
14874	Book Fan	\N
14875	Rhisa	\N
14876	Nicki	\N
14877	Miss America Contestant	\N
14878	Remy	\N
14879	Olive	\N
14880	Holly	\N
14881	Jerry's Girlfriend	\N
14882	Bonnie	\N
14883	Foreman	\N
14884	Mr. Morgans Secretary	\N
14885	Judy	\N
14886	Amanda	\N
14887	Mother with Baby	\N
14888	Gillian	\N
14889	Woman Behind Counter	\N
14890	Bridgette	\N
14891	Medical Student	\N
14892	Nana	\N
14893	Hildy	\N
14894	Dolores	\N
14895	Mystery Woman	\N
14896	Casting Director	\N
14897	Nun	\N
14898	Vivian	\N
14899	Attendant #2	\N
14900	Helene	\N
14901	Cute Girl	\N
14902	Crowd	\N
14903	Woman in Audience	\N
14904	Woman Carrying George	\N
14905	O'Neal	\N
14906	Hippie #2	\N
14907	Pamela	\N
14908	Woman on Subway with Elaine	\N
14909	Sandi Robbins (Elaine)	\N
14910	Debby	\N
14911	Christie	\N
14912	Mrs. Ross	\N
14913	Rental Car Agent	\N
14914	Lenore	\N
\.


--
-- Data for Name: episode; Type: TABLE DATA; Schema: public; Owner: seinfeld
--

COPY episode (episode_id, title, airdate, season, seasonnumber, imdbrating, synopsis, production_code, episode_number, generated_synopsis) FROM stdin;
4	Male Unbonding	1990-06-14	1	4	7.5999999	\N	102	4	\N
50	The Airport	1992-11-25	4	12	8.89999962	\N	412	52	\N
10	The Apartment	1991-04-04	2	5	8	\N	208	10	\N
15	The Baby Shower	1991-05-16	2	10	7.80000019	\N	204	15	\N
69	The Barber	1993-11-11	5	8	8.30000019	\N	508	72	\N
97	The Beard	1995-02-09	6	16	8.5	\N	615	102	\N
84	The Big Salad	1994-09-29	6	2	8.30000019	\N	602	88	\N
34	The Boyfriend	1992-02-12	3	17	8.89999962	\N	315	34	\N
66	The Bris	1993-10-14	5	5	8.19999981	\N	505	69	\N
45	The Bubble Boy	1992-10-07	4	7	8.69999981	\N	407	47	\N
17	The Busboy	1991-06-26	2	12	7.9000001	\N	203	17	\N
24	The Café	1991-11-06	3	7	8.60000038	\N	307	24	\N
46	The Cheever Letters	1992-10-28	4	8	8.5	\N	408	48	\N
16	The Chinese Restaurant	1991-05-23	2	11	8.69999981	\N	206	16	\N
86	The Chinese Woman	1994-10-13	6	4	8.30000019	\N	604	90	\N
71	The Cigar Store Indian	1993-12-09	5	10	8.39999962	\N	510	74	\N
49	The Contest	1992-11-18	4	11	9.5	\N	411	51	\N
72	The Conversion	1993-12-16	5	11	8.19999981	\N	511	75	\N
87	The Couch	1994-10-27	6	5	8.5	\N	605	91	\N
14	The Deal	1991-05-02	2	9	8.30000019	\N	213	14	\N
103	The Diplomat's Club	1995-05-04	6	22	8.19999981	\N	620	108	\N
21	The Dog	1991-10-09	3	4	7.4000001	\N	303	21	\N
101	The Doodle	1995-04-06	6	20	8.5	\N	618	106	\N
99	The Doorman	1995-02-23	6	18	8.5	\N	616	104	\N
106	The Engagement	1995-09-21	7	1	8.5	\N	701	111	\N
6	The Ex-Girlfriend	1991-01-23	2	1	7.80000019	\N	201	6	\N
104	The Face Painter	1995-05-11	6	23	8.60000038	\N	622	109	\N
80	The Fire	1994-05-05	5	20	8.80000019	\N	518	84	\N
33	The Fix-Up	1992-02-05	3	16	8.30000019	\N	317	33	\N
64	The Glasses	1993-09-30	5	3	8.30000019	\N	502	67	\N
36	The Good Samaritan	1992-03-04	3	20	8.10000038	\N	319	37	\N
115	The Gum	1995-12-14	7	10	8.80000019	\N	710	120	\N
88	The Gymnast	1994-11-03	6	6	8.39999962	\N	606	92	\N
81	The Hamptons	1994-05-12	5	21	9.10000038	\N	521	85	\N
60	The Handicap Spot	1993-05-13	4	22	8.5	\N	420	62	\N
13	The Heart Attack	1991-04-25	2	8	8.10000038	\N	211	13	\N
110	The Hot Tub	1995-10-19	7	5	8.69999981	\N	705	115	\N
57	The Implant	1993-02-25	4	19	8.69999981	\N	419	59	\N
8	The Jacket	1991-02-06	2	3	8.5	\N	205	8	\N
58	The Junior Mint	1993-03-18	4	20	8.89999962	\N	421	60	\N
39	The Keys	1992-05-06	3	23	8.69999981	\N	322	40	\N
98	The Kiss Hello	1995-02-16	6	17	8.19999981	\N	614	103	\N
94	The Label Maker	1995-01-19	6	12	8.69999981	\N	611	98	\N
37	The Letter	1992-03-25	3	21	8	\N	320	38	\N
22	The Library	1991-10-16	3	5	8.80000019	\N	304	22	\N
35	The Limo	1992-02-26	3	19	8.80000019	\N	318	36	\N
108	The Maestro	1995-10-05	7	3	8.19999981	\N	703	113	\N
62	The Mango	1993-09-16	5	1	8.60000038	\N	501	65	\N
75	The Marine Biologist	1994-02-10	5	14	9.19999981	\N	513	78	\N
70	The Masseuse	1993-11-18	5	9	8.10000038	\N	509	73	\N
90	The Mom & Pop Store	1994-11-17	6	8	8.30000019	\N	608	94	\N
52	The Movie	1993-01-06	4	14	8.39999962	\N	414	54	\N
68	The Non-Fat Yogurt	1993-11-04	5	7	8.5	\N	507	71	\N
26	The Nose Job	1991-11-20	3	9	8.10000038	\N	309	26	\N
18	The Note	1991-09-18	3	1	8.30000019	\N	301	18	\N
47	The Opera	1992-11-04	4	9	8.39999962	\N	409	49	\N
82	The Opposite	1994-05-19	5	22	9.39999962	\N	522	86	\N
55	The Outing	1993-02-11	4	17	9.10000038	\N	416	57	\N
23	The Parking Garage	1991-10-30	3	6	8.80000019	\N	306	23	\N
38	The Parking Space	1992-04-22	3	22	8.5	\N	321	39	\N
20	The Pen	1991-10-02	3	3	8.39999962	\N	305	20	\N
31	The Pez Dispenser	1992-01-15	3	14	8.60000038	\N	314	31	\N
51	The Pick	1992-12-16	4	13	8.69999981	\N	413	53	\N
76	The Pie	1994-02-17	5	15	8.60000038	\N	515	79	\N
61	The Pilot	1993-05-20	4	23	8.89999962	\N	423	63	\N
41	The Pitch	1992-09-16	4	3	8.69999981	\N	403	43	\N
85	The Pledge Drive	1994-10-06	6	3	8.30000019	\N	603	89	\N
7	The Pony Remark	1991-01-30	2	2	8	\N	202	7	\N
113	The Pool Guy	1995-11-16	7	8	8.30000019	\N	708	118	\N
107	The Postponement	1995-09-28	7	2	8.19999981	\N	702	112	\N
63	The Puffy Shirt	1993-09-23	5	2	9	\N	503	66	\N
92	The Race	1994-12-15	6	10	9	\N	612	96	\N
29	The Red Dot	1991-12-11	3	12	8.5	\N	311	29	\N
12	The Revenge	1991-04-18	2	7	8.39999962	\N	212	12	\N
3	The Robbery	1990-06-07	1	3	7.80000019	\N	104	3	\N
95	The Scofflaw	1995-01-26	6	13	8.19999981	\N	613	99	\N
112	The Secret Code	1995-11-09	7	7	8.30000019	\N	707	117	\N
91	The Secretary	1994-12-08	6	9	8.19999981	\N	609	95	\N
54	The Shoes	1993-02-04	4	16	8.5	\N	417	56	\N
59	The Smelly Car	1993-04-15	4	21	8.80000019	\N	422	61	\N
89	The Soup	1994-11-10	6	7	8.39999962	\N	607	93	\N
114	The Sponge	1995-12-07	7	9	8.5	\N	709	119	\N
111	The Soup Nazi	1995-11-02	7	6	9.5	\N	706	116	\N
2	The Stake Out	1990-05-31	1	2	7.9000001	\N	103	2	\N
73	The Stall	1994-01-06	5	12	8.69999981	\N	512	76	\N
77	The Stand-In	1994-02-24	5	16	8.10000038	\N	516	80	\N
11	The Statue	1991-04-11	2	6	8.19999981	\N	210	11	\N
5	The Stock Tip	1990-06-21	1	5	7.80000019	\N	105	5	\N
27	The Stranded	1991-11-27	2	10	7.5	\N	209	27	\N
30	The Subway	1992-01-08	3	13	8.69999981	\N	313	30	\N
93	The Switch	1995-01-05	6	11	8.89999962	\N	610	97	\N
25	The Tape	1991-11-13	3	8	8.60000038	\N	308	25	\N
42	The Ticket	1992-09-16	4	4	8.60000038	\N	404	44	\N
40	The Trip	1992-08-12	4	1	8.39999962	\N	401	41	\N
19	The Truth	1991-09-25	3	2	7.9000001	\N	302	19	\N
105	The Understudy	1995-05-18	6	24	8.30000019	\N	621	110	\N
48	The Virgin	1992-11-11	4	10	8.39999962	\N	410	50	\N
53	The Visa	1993-01-27	4	15	8.30000019	\N	415	55	\N
44	The Watch	1992-09-30	4	6	8.30000019	\N	406	46	\N
78	The Wife	1994-03-17	5	17	8.10000038	\N	517	81	\N
109	The Wink	1995-10-12	7	4	8.69999981	\N	704	114	\N
1	The Seinfeld Chronicles	1989-07-05	1	1	7.9000001	\N	101	1	\N
96	The Highlights of 100	1995-02-02	6	14	7.5999999	\N	623	100	\N
136	The Abstinence	1996-11-21	8	9	8.89999962	\N	809	143	\N
28	The Alternate Side	1991-12-04	3	11	8.39999962	\N	310	28	\N
137	The Andrea Doria	1996-12-19	8	10	8.60000038	\N	810	144	\N
158	The Apology	1997-12-11	9	9	8.30000019	\N	909	165	\N
157	The Betrayal	1997-11-20	9	8	9.19999981	\N	908	164	\N
130	The Bizarro Jerry	1996-10-03	8	3	9.10000038	\N	803	137	\N
153	The Blood	1997-10-16	9	4	8.30000019	\N	904	160	\N
166	The Bookstore	1998-04-16	9	17	8.39999962	\N	917	173	\N
125	The Bottle Deposit	1996-05-02	7	21	8.80000019	\N	721	131	\N
165	The Burning	1998-03-19	9	16	8.5	\N	916	172	\N
150	The Butter Shave	1997-09-25	9	1	8.69999981	\N	901	157	\N
117	The Caddy	1996-01-25	7	12	8.60000038	\N	712	122	\N
119	The Cadillac	1996-02-08	7	14	8.5	\N	714	124	\N
124	The Calzone	1996-04-25	7	20	8.80000019	\N	720	130	\N
162	The Cartoon	1998-01-29	9	13	8	\N	913	169	\N
83	The Chaperone	1994-09-22	6	1	8.19999981	\N	601	87	\N
134	The Checks	1996-11-07	8	7	8.39999962	\N	807	141	\N
135	The Chicken Roaster	1996-11-14	8	8	9.10000038	\N	808	142	\N
145	The Nap	1997-04-10	8	18	8.89999962	\N	818	152	\N
170	The Chronicle	1998-05-14	9	21	8.19999981	\N	921	177	\N
140	The Comeback	1997-01-30	8	13	8.80000019	\N	812	147	\N
56	The Old Man	1993-02-18	4	18	8.39999962	\N	418	58	\N
160	The Dealership	1998-01-08	9	11	8.60000038	\N	911	167	\N
74	The Dinner Party	1994-02-03	5	13	8.30000019	\N	514	77	\N
121	The Doll	1996-02-22	7	17	8.30000019	\N	716	127	\N
144	The English Patient	1997-03-13	8	17	8.5	\N	817	151	\N
133	The Fatigues	1996-10-31	8	6	8.30000019	\N	806	140	\N
171	The Finale	1998-05-14	9	23	8.10000038	\N	923	179	\N
128	The Foundation	1996-09-19	8	1	8.39999962	\N	801	135	\N
122	The Friar's Club	1996-03-07	7	18	8	\N	718	128	\N
167	The Frogger	1998-04-23	9	18	8.89999962	\N	918	174	\N
102	The Fusilli Jerry	1995-04-27	6	21	8.89999962	\N	619	107	\N
127	The Invitations	1996-05-16	7	24	8.69999981	\N	724	134	\N
100	The Jimmy	1995-03-16	6	19	9.10000038	\N	617	105	\N
154	The Junk Mail	1997-10-30	9	5	8.39999962	\N	905	161	\N
67	The Lip Reader	1993-10-28	5	6	8.60000038	\N	506	70	\N
138	The Little Jerry	1997-01-09	8	11	8.60000038	\N	811	145	\N
131	The Little Kicks	1996-10-10	8	4	8.80000019	\N	804	138	\N
168	The Maid	1998-04-30	9	19	8	\N	919	175	\N
155	The Merv Griffin Show	1997-11-06	9	6	8.89999962	\N	906	162	\N
147	The Millennium	1997-05-01	8	20	8.19999981	\N	820	154	\N
139	The Money	1997-01-16	8	12	8	\N	813	146	\N
148	The Muffin Tops	1997-05-08	8	21	8.5	\N	821	155	\N
132	The Package	1996-10-17	8	5	8.69999981	\N	805	139	\N
9	The Phone Message	1991-02-13	2	4	8.5	\N	207	9	\N
143	The Pothole	1997-02-20	8	16	8.60000038	\N	816	150	\N
169	The Puerto Rican Day	1998-05-07	9	20	8.39999962	\N	920	176	\N
79	The Raincoats	1994-04-28	5	18	8.60000038	\N	519	82	\N
161	The Reverse Peephole	1998-01-15	9	12	8.60000038	\N	912	168	\N
116	The Rye	1996-01-04	7	11	8.69999981	\N	711	121	\N
152	The Serenity Now	1997-10-09	9	3	8.89999962	\N	903	159	\N
118	The Seven	1996-02-01	7	13	8.19999981	\N	713	123	\N
120	The Shower Head	1996-02-15	7	16	8.39999962	\N	715	126	\N
156	The Slicer	1997-11-13	9	7	8.30000019	\N	907	163	\N
65	The Sniffing Accountant	1993-10-07	5	4	8.19999981	\N	504	68	\N
129	The Soul Mate	1996-09-26	8	2	8.19999981	\N	802	136	\N
159	The Strike	1997-12-18	9	10	8.69999981	\N	910	166	\N
163	The Strong Box	1998-02-05	9	14	8.19999981	\N	914	170	\N
32	The Suicide	1992-01-29	3	15	7.80000019	\N	312	32	\N
149	The Summer of George	1997-05-15	8	22	8.60000038	\N	822	156	\N
142	The Susie	1997-02-13	8	15	8.30000019	\N	815	149	\N
141	The Van Buren Boys	1997-02-06	8	14	8.19999981	\N	814	148	\N
151	The Voice	1997-10-02	9	2	8.60000038	\N	902	158	\N
126	The Wait Out	1996-05-09	7	23	8.39999962	\N	723	133	\N
43	The Wallet	1992-09-23	4	5	8.19999981	\N	405	45	\N
123	The Wig Master	1996-04-04	7	19	8.19999981	\N	719	129	\N
164	The Wizard	1998-02-26	9	15	8.19999981	\N	915	171	\N
146	The Yada Yada	1997-04-24	8	19	8.89999962	\N	819	153	\N
\.


--
-- Data for Name: episode_has_person_in_role; Type: TABLE DATA; Schema: public; Owner: seinfeld
--

COPY episode_has_person_in_role (episode_id, person_id, role_id, character_id) FROM stdin;
1	2	3	\N
1	3	3	\N
1	1	2	\N
2	2	3	\N
2	3	3	\N
2	4	2	\N
3	5	3	\N
3	4	2	\N
4	2	3	\N
4	3	3	\N
4	4	2	\N
5	2	3	\N
5	3	3	\N
5	4	2	\N
6	2	3	\N
6	3	3	\N
6	4	2	\N
7	2	3	\N
7	3	3	\N
7	4	2	\N
8	2	3	\N
8	3	3	\N
8	4	2	\N
9	2	3	\N
9	3	3	\N
9	4	2	\N
10	6	3	\N
10	4	2	\N
11	7	3	\N
11	4	2	\N
12	2	3	\N
12	4	2	\N
13	7	3	\N
13	4	2	\N
14	2	3	\N
14	4	2	\N
15	7	3	\N
15	4	2	\N
16	2	3	\N
16	3	3	\N
16	4	2	\N
17	2	3	\N
17	3	3	\N
17	4	2	\N
18	2	3	\N
18	4	2	\N
19	9	3	\N
19	8	2	\N
20	2	3	\N
20	4	2	\N
21	2	3	\N
21	4	2	\N
22	7	3	\N
22	10	2	\N
23	2	3	\N
23	4	2	\N
24	11	3	\N
24	4	2	\N
25	2	3	\N
25	12	3	\N
25	13	3	\N
25	8	2	\N
26	6	3	\N
26	4	2	\N
27	2	3	\N
27	3	3	\N
27	5	3	\N
27	4	2	\N
28	2	3	\N
28	14	3	\N
28	4	2	\N
29	2	3	\N
29	4	2	\N
30	7	3	\N
30	4	2	\N
31	2	3	\N
31	4	2	\N
32	11	3	\N
32	4	2	\N
33	9	3	\N
33	7	3	\N
33	4	2	\N
34	2	3	\N
34	15	3	\N
34	4	2	\N
35	7	3	\N
35	16	3	\N
35	4	2	\N
36	6	3	\N
36	17	2	\N
37	2	3	\N
37	4	2	\N
38	2	3	\N
38	18	3	\N
38	4	2	\N
39	7	3	\N
39	4	2	\N
40	7	3	\N
40	4	2	\N
41	2	3	\N
41	4	2	\N
42	2	3	\N
42	4	2	\N
43	2	3	\N
43	4	2	\N
44	2	3	\N
44	4	2	\N
45	2	3	\N
45	7	3	\N
45	4	2	\N
46	2	3	\N
46	2	3	\N
46	9	3	\N
46	11	3	\N
46	4	2	\N
47	7	3	\N
47	4	2	\N
48	6	3	\N
48	6	3	\N
48	19	3	\N
48	20	3	\N
48	4	2	\N
49	2	3	\N
49	4	2	\N
50	7	3	\N
50	4	2	\N
51	2	3	\N
51	2	3	\N
51	16	3	\N
51	4	2	\N
52	21	3	\N
52	14	3	\N
52	22	3	\N
52	4	2	\N
53	6	3	\N
53	4	2	\N
54	2	3	\N
54	3	3	\N
54	4	2	\N
55	7	3	\N
55	4	2	\N
56	7	3	\N
56	23	3	\N
56	4	2	\N
57	6	3	\N
57	4	2	\N
58	24	3	\N
58	4	2	\N
59	2	3	\N
59	6	3	\N
59	4	2	\N
60	2	3	\N
60	4	2	\N
61	2	3	\N
61	4	2	\N
62	25	3	\N
62	2	3	\N
62	25	3	\N
62	4	2	\N
63	2	3	\N
63	4	2	\N
64	26	3	\N
64	27	3	\N
64	4	2	\N
65	2	3	\N
65	3	3	\N
65	4	2	\N
66	7	3	\N
66	4	2	\N
67	28	3	\N
67	4	2	\N
68	2	3	\N
68	4	2	\N
69	24	3	\N
69	4	2	\N
70	6	3	\N
70	4	2	\N
71	26	3	\N
71	27	3	\N
71	4	2	\N
72	23	3	\N
72	4	2	\N
73	7	3	\N
73	4	2	\N
74	2	3	\N
74	4	2	\N
75	29	3	\N
75	30	3	\N
75	4	2	\N
76	26	3	\N
76	27	3	\N
76	4	2	\N
77	2	3	\N
77	4	2	\N
78	6	3	\N
78	4	2	\N
79	26	3	\N
79	27	3	\N
79	2	3	\N
79	3	3	\N
79	4	2	\N
80	7	3	\N
80	4	2	\N
81	6	3	\N
81	28	3	\N
81	4	2	\N
82	31	3	\N
82	2	3	\N
82	3	3	\N
82	4	2	\N
83	2	3	\N
83	14	3	\N
83	12	3	\N
83	32	2	\N
84	2	3	\N
84	32	2	\N
85	26	3	\N
85	27	3	\N
85	32	2	\N
86	6	3	\N
86	32	2	\N
87	2	3	\N
87	32	2	\N
88	33	3	\N
88	34	3	\N
88	32	2	\N
89	35	3	\N
89	32	2	\N
90	26	3	\N
90	27	3	\N
90	32	2	\N
91	28	3	\N
91	37	3	\N
91	36	2	\N
92	26	3	\N
92	27	3	\N
92	2	3	\N
92	26	3	\N
92	27	3	\N
92	2	3	\N
92	38	3	\N
92	32	2	\N
93	23	3	\N
93	38	3	\N
93	32	2	\N
94	33	3	\N
94	34	3	\N
94	32	2	\N
95	6	3	\N
95	32	2	\N
96	6	3	\N
96	32	2	\N
97	28	3	\N
97	32	2	\N
98	2	3	\N
98	3	3	\N
98	32	2	\N
99	26	3	\N
99	27	3	\N
99	32	2	\N
100	39	3	\N
100	24	3	\N
100	32	2	\N
101	33	3	\N
101	34	3	\N
101	32	2	\N
102	37	3	\N
102	37	3	\N
102	40	3	\N
102	29	3	\N
102	30	3	\N
102	32	2	\N
103	26	3	\N
103	27	3	\N
103	32	2	\N
104	2	3	\N
104	2	3	\N
104	35	3	\N
104	32	2	\N
105	37	3	\N
105	28	3	\N
105	32	2	\N
106	2	3	\N
106	32	2	\N
107	2	3	\N
107	32	2	\N
108	2	3	\N
108	32	2	\N
109	26	3	\N
109	27	3	\N
109	32	2	\N
110	39	3	\N
110	24	3	\N
110	32	2	\N
111	41	3	\N
111	32	2	\N
112	33	3	\N
112	34	3	\N
112	32	2	\N
113	42	3	\N
113	32	2	\N
114	6	3	\N
114	32	2	\N
115	26	3	\N
115	27	3	\N
115	32	2	\N
116	28	3	\N
116	32	2	\N
117	39	3	\N
117	24	3	\N
117	32	2	\N
118	33	3	\N
118	34	3	\N
118	32	2	\N
119	2	3	\N
119	3	3	\N
119	32	2	\N
120	6	3	\N
120	37	3	\N
120	32	2	\N
121	26	3	\N
121	27	3	\N
121	32	2	\N
122	42	3	\N
122	32	2	\N
123	41	3	\N
123	32	2	\N
124	33	3	\N
124	34	3	\N
124	32	2	\N
125	39	3	\N
125	24	3	\N
125	32	2	\N
126	6	3	\N
126	6	3	\N
126	43	3	\N
126	32	2	\N
127	2	3	\N
127	32	2	\N
128	33	3	\N
128	34	3	\N
128	32	2	\N
129	6	3	\N
129	32	2	\N
130	42	3	\N
130	32	2	\N
131	41	3	\N
131	32	2	\N
132	44	3	\N
132	32	2	\N
133	39	3	\N
133	24	3	\N
133	32	2	\N
134	45	3	\N
134	26	3	\N
134	27	3	\N
134	32	2	\N
135	33	3	\N
135	34	3	\N
135	32	2	\N
136	46	3	\N
136	32	2	\N
137	41	3	\N
137	32	2	\N
138	44	3	\N
138	32	2	\N
139	6	3	\N
139	32	2	\N
140	39	3	\N
140	24	3	\N
140	36	2	\N
141	47	3	\N
141	32	2	\N
142	42	3	\N
142	32	2	\N
143	45	3	\N
143	48	3	\N
143	32	2	\N
144	46	3	\N
144	32	2	\N
145	39	3	\N
145	24	3	\N
145	32	2	\N
146	6	3	\N
146	49	3	\N
146	32	2	\N
147	44	3	\N
147	32	2	\N
148	41	3	\N
148	32	2	\N
149	33	3	\N
149	34	3	\N
149	32	2	\N
150	33	3	\N
150	34	3	\N
150	42	3	\N
150	32	2	\N
151	33	3	\N
151	34	3	\N
151	42	3	\N
151	32	2	\N
152	46	3	\N
152	32	2	\N
153	48	3	\N
153	32	2	\N
154	41	3	\N
154	32	2	\N
155	50	3	\N
155	32	2	\N
156	39	3	\N
156	24	3	\N
156	39	3	\N
156	24	3	\N
156	47	3	\N
156	32	2	\N
157	42	3	\N
157	6	3	\N
157	32	2	\N
158	44	3	\N
158	32	2	\N
159	48	3	\N
159	33	3	\N
159	34	3	\N
159	32	2	\N
160	46	3	\N
160	32	2	\N
161	41	3	\N
161	32	2	\N
162	50	3	\N
162	32	2	\N
163	48	3	\N
163	48	3	\N
163	51	3	\N
163	32	2	\N
164	52	3	\N
164	32	2	\N
165	44	3	\N
165	32	2	\N
166	41	3	\N
166	41	3	\N
166	47	3	\N
166	16	3	\N
166	32	2	\N
167	39	3	\N
167	24	3	\N
167	39	3	\N
167	24	3	\N
167	46	3	\N
167	48	3	\N
167	32	2	\N
168	33	3	\N
168	42	3	\N
168	34	3	\N
168	33	3	\N
168	42	3	\N
168	34	3	\N
168	53	3	\N
168	6	3	\N
168	32	2	\N
169	33	3	\N
169	44	3	\N
169	41	3	\N
169	50	3	\N
169	39	3	\N
169	46	3	\N
169	42	3	\N
169	48	3	\N
169	24	3	\N
169	34	3	\N
169	32	2	\N
170	47	3	\N
170	32	2	\N
171	2	3	\N
171	32	2	\N
83	54	1	13842
103	54	1	13843
99	54	1	13843
171	54	1	13843
88	54	1	13842
90	54	1	13843
85	54	1	13842
118	55	1	13844
142	56	1	13845
143	57	1	13846
47	58	1	13847
169	59	1	13848
135	60	1	13849
1	61	1	13850
96	61	1	13851
4	61	1	13851
136	61	1	13851
50	61	1	13851
28	61	1	13851
137	61	1	13851
10	61	1	13851
158	61	1	13851
15	61	1	13851
69	61	1	13851
97	61	1	13851
157	61	1	13851
84	61	1	13851
130	61	1	13851
153	61	1	13851
166	61	1	13851
125	61	1	13851
34	61	1	13851
66	61	1	13851
45	61	1	13851
165	61	1	13851
17	61	1	13851
150	61	1	13851
117	61	1	13851
119	61	1	13851
24	61	1	13851
124	61	1	13851
162	61	1	13851
83	61	1	13851
134	61	1	13851
46	61	1	13851
135	61	1	13851
16	61	1	13851
86	61	1	13851
170	61	1	13851
71	61	1	13851
140	61	1	13851
49	61	1	13851
72	61	1	13851
87	61	1	13851
14	61	1	13851
160	61	1	13851
74	61	1	13851
103	61	1	13851
21	61	1	13851
121	61	1	13851
101	61	1	13851
99	61	1	13851
106	61	1	13851
144	61	1	13851
6	61	1	13851
104	61	1	13851
133	61	1	13851
171	61	1	13851
80	61	1	13851
33	61	1	13851
128	61	1	13851
122	61	1	13851
167	61	1	13851
102	61	1	13851
64	61	1	13851
36	61	1	13851
115	61	1	13851
88	61	1	13851
81	61	1	13851
60	61	1	13851
13	61	1	13851
110	61	1	13851
57	61	1	13851
127	61	1	13851
8	61	1	13851
100	61	1	13851
58	61	1	13851
154	61	1	13851
39	61	1	13851
98	61	1	13851
94	61	1	13851
37	61	1	13851
22	61	1	13851
35	61	1	13851
67	61	1	13851
138	61	1	13851
131	61	1	13851
108	61	1	13851
168	61	1	13851
62	61	1	13851
75	61	1	13851
70	61	1	13851
155	61	1	13851
147	61	1	13851
90	61	1	13851
139	61	1	13851
52	61	1	13851
148	61	1	13851
145	61	1	13851
68	61	1	13851
26	61	1	13851
18	61	1	13851
56	61	1	13851
47	61	1	13851
82	61	1	13851
55	61	1	13851
132	61	1	13851
23	61	1	13851
38	61	1	13851
20	61	1	13851
31	61	1	13851
9	61	1	13851
51	61	1	13851
76	61	1	13851
61	61	1	13851
41	61	1	13851
85	61	1	13851
7	61	1	13851
113	61	1	13851
107	61	1	13851
143	61	1	13851
169	61	1	13851
63	61	1	13851
92	61	1	13851
79	61	1	13851
29	61	1	13851
12	61	1	13851
161	61	1	13851
3	61	1	13851
116	61	1	13851
95	61	1	13851
112	61	1	13851
91	61	1	13851
152	61	1	13851
118	61	1	13851
54	61	1	13851
120	61	1	13851
156	61	1	13851
59	61	1	13851
65	61	1	13851
129	61	1	13851
89	61	1	13851
111	61	1	13851
114	61	1	13851
2	61	1	13851
73	61	1	13851
77	61	1	13851
11	61	1	13851
5	61	1	13851
27	61	1	13851
159	61	1	13851
163	61	1	13851
30	61	1	13851
32	61	1	13851
149	61	1	13851
142	61	1	13851
93	61	1	13851
25	61	1	13851
42	61	1	13851
40	61	1	13851
19	61	1	13851
105	61	1	13851
141	61	1	13851
48	61	1	13851
53	61	1	13851
151	61	1	13851
126	61	1	13851
43	61	1	13851
44	61	1	13851
78	61	1	13851
123	61	1	13851
109	61	1	13851
164	61	1	13851
146	61	1	13851
124	62	1	13852
133	63	1	13853
171	64	1	13854
57	65	1	13855
61	65	1	13855
116	66	1	13856
171	67	1	13857
67	68	1	13858
52	69	1	13847
25	70	1	13859
31	71	1	13860
12	72	1	13861
38	73	1	13862
142	73	1	13862
40	74	1	13863
112	75	1	13864
118	76	1	13865
90	77	1	13866
164	78	1	13867
34	79	1	13868
132	80	1	13869
94	81	1	13870
61	82	1	13868
159	83	1	13871
74	84	1	13872
108	85	1	13873
149	86	1	13874
59	87	1	13875
61	88	1	13876
41	88	1	13877
54	88	1	13876
42	88	1	13876
44	88	1	13877
17	89	1	13878
137	90	1	13879
167	91	1	13880
148	91	1	13881
31	92	1	13882
119	93	1	13883
139	93	1	13883
20	93	1	13883
79	93	1	13883
110	94	1	13873
111	94	1	13884
28	95	1	13885
82	95	1	13886
161	96	1	13887
105	97	1	13888
77	98	1	13889
125	99	1	13890
117	99	1	13890
124	99	1	13890
171	99	1	13890
110	99	1	13890
100	99	1	13890
148	99	1	13890
92	99	1	13890
91	99	1	13890
109	99	1	13890
59	100	1	13891
130	101	1	13892
105	101	1	13893
53	102	1	13894
167	103	1	13895
56	104	1	13896
133	105	1	13878
76	106	1	13897
162	107	1	13898
74	108	1	13899
140	109	1	13900
40	110	1	13901
77	111	1	13902
99	112	1	13903
104	113	1	13904
110	114	1	13905
57	115	1	13906
70	116	1	13907
10	117	1	13908
46	117	1	13909
88	117	1	13910
60	117	1	13911
75	117	1	13912
26	117	1	13913
3	117	1	13844
154	118	1	13914
39	119	1	13915
137	120	1	13916
171	121	1	13917
61	121	1	13918
41	121	1	13917
42	121	1	13918
48	121	1	13918
31	122	1	13919
7	123	1	13920
30	124	1	13921
128	125	1	13922
126	125	1	13922
134	126	1	13923
61	127	1	13924
90	128	1	13925
121	129	1	13926
157	130	1	13927
60	131	1	13928
82	131	1	13929
95	132	1	13930
130	133	1	13931
166	134	1	13932
16	134	1	13933
87	134	1	13934
14	134	1	13935
21	134	1	13936
101	134	1	13937
99	134	1	13938
6	134	1	13936
133	134	1	13939
80	134	1	13940
33	134	1	13941
8	134	1	13846
100	134	1	13942
98	134	1	13936
22	134	1	13943
35	134	1	13944
108	134	1	13942
148	134	1	13945
61	134	1	13946
92	134	1	13947
91	134	1	13948
54	134	1	13949
65	134	1	13940
2	134	1	13950
77	134	1	13951
5	134	1	13873
25	134	1	13952
123	134	1	13953
72	135	1	13954
100	136	1	13885
153	137	1	13955
144	137	1	13955
154	138	1	13956
63	139	1	13957
123	140	1	13958
26	141	1	13959
28	142	1	13960
38	142	1	13960
157	143	1	13961
77	144	1	13962
114	145	1	13963
131	146	1	13964
18	147	1	13965
2	148	1	13966
50	149	1	13967
81	150	1	13968
50	151	1	13969
148	152	1	13937
61	153	1	13970
117	154	1	13971
67	154	1	13972
82	154	1	13973
169	154	1	13852
95	154	1	13974
171	155	1	13975
114	155	1	13976
106	156	1	13846
166	157	1	13977
167	157	1	13978
146	158	1	13979
148	159	1	13980
150	160	1	13981
169	161	1	13868
118	162	1	13982
103	163	1	13975
12	164	1	13983
171	165	1	13984
51	165	1	13985
171	166	1	13986
44	167	1	13987
148	168	1	13945
136	169	1	13988
158	169	1	13989
103	169	1	13990
115	169	1	13973
112	169	1	13991
105	169	1	13992
47	170	1	13844
146	171	1	13993
50	172	1	13994
23	172	1	13995
61	172	1	13996
38	173	1	13997
171	4	1	13939
61	4	1	13998
143	174	1	13999
27	175	1	14000
47	176	1	14001
168	177	1	14002
92	178	1	14003
115	179	1	14004
52	180	1	14005
69	181	1	14006
70	182	1	14007
168	183	1	14008
141	184	1	14009
124	185	1	14010
103	186	1	14011
144	186	1	14012
169	187	1	14013
11	188	1	14014
122	189	1	13901
164	190	1	14015
102	191	1	13911
168	192	1	14016
149	192	1	13951
73	193	1	14017
38	194	1	14018
103	195	1	13846
90	196	1	14019
100	197	1	14020
94	197	1	14020
90	197	1	14020
159	197	1	14020
146	197	1	14020
168	198	1	14021
47	199	1	14022
61	199	1	14023
41	199	1	14024
42	199	1	14022
44	199	1	14024
99	200	1	14025
65	200	1	14025
102	201	1	14026
137	202	1	14027
110	203	1	14028
115	204	1	13928
124	205	1	14029
169	206	1	14030
23	207	1	14031
67	208	1	14032
44	209	1	13909
50	210	1	14033
28	210	1	14034
125	210	1	13890
117	210	1	13890
124	210	1	13890
16	210	1	14035
86	210	1	14036
71	210	1	14037
74	210	1	14038
171	210	1	14039
80	210	1	14040
115	210	1	14041
13	210	1	14042
110	210	1	13890
100	210	1	13890
67	210	1	14043
75	210	1	14044
147	210	1	13890
52	210	1	14045
148	210	1	13890
145	210	1	13890
82	210	1	13890
38	210	1	14046
20	210	1	14047
51	210	1	14048
61	210	1	14049
41	210	1	14050
92	210	1	13890
79	210	1	14051
12	210	1	14052
91	210	1	13890
77	210	1	14053
30	210	1	14037
93	210	1	13871
105	210	1	14054
123	210	1	14055
109	210	1	13890
76	211	1	14056
5	212	1	14057
128	213	1	14058
129	213	1	14058
141	213	1	14058
120	214	1	14059
3	215	1	14060
104	216	1	14061
130	217	1	14062
129	217	1	14062
77	218	1	14063
109	218	1	14064
17	219	1	13873
149	220	1	14003
59	221	1	14065
120	222	1	13846
52	223	1	14066
105	224	1	14067
97	225	1	14068
109	226	1	14069
159	227	1	14070
56	229	1	13968
148	230	1	13937
149	231	1	13941
45	232	1	14071
171	232	1	14072
61	232	1	14071
102	233	1	13853
158	234	1	14009
171	234	1	14073
23	234	1	13911
4	235	1	14007
111	236	1	14070
101	237	1	14074
153	238	1	14075
144	238	1	14075
41	239	1	14076
42	239	1	14076
104	240	1	14077
76	241	1	14078
52	242	1	13973
87	243	1	13875
98	244	1	14079
126	245	1	13970
118	246	1	13951
3	247	1	13928
171	248	1	13937
56	249	1	13960
61	249	1	13960
74	250	1	14080
167	251	1	13862
23	252	1	14081
47	253	1	14082
171	254	1	14083
2	255	1	13976
69	256	1	14084
71	257	1	14085
171	257	1	14086
37	257	1	14085
75	257	1	14086
148	257	1	14086
82	257	1	14086
29	257	1	14087
95	257	1	14086
152	257	1	14086
65	257	1	14086
41	258	1	14088
42	258	1	14088
23	259	1	14089
137	260	1	14090
80	261	1	14091
142	262	1	14092
171	41	1	13854
147	41	1	14093
161	263	1	14094
158	264	1	14095
98	265	1	14096
90	266	1	14097
168	267	1	14098
13	268	1	14099
60	269	1	14100
159	270	1	14101
122	271	1	14102
149	272	1	14076
150	273	1	14103
116	274	1	13873
155	275	1	13901
132	276	1	14104
119	277	1	14105
168	278	1	14106
146	279	1	13954
7	280	1	14107
82	281	1	14108
90	282	1	14109
46	283	1	14110
171	283	1	14110
128	283	1	14110
116	283	1	14110
164	283	1	14110
140	284	1	13853
68	285	1	14111
59	286	1	13935
90	287	1	14112
137	288	1	14113
69	289	1	14048
134	289	1	14114
71	289	1	14037
95	289	1	13974
61	290	1	13985
144	291	1	14115
125	292	1	14017
55	293	1	13844
136	294	1	14116
66	295	1	14117
24	296	1	14118
171	296	1	14119
53	296	1	14119
2	297	1	14120
150	298	1	14121
40	299	1	14122
45	300	1	13844
89	301	1	14123
104	302	1	14124
149	303	1	14125
55	304	1	13865
99	305	1	14126
38	306	1	14127
77	307	1	14128
148	308	1	14129
123	308	1	14130
51	309	1	14131
68	310	1	13901
131	311	1	14132
35	312	1	14133
82	313	1	14134
166	314	1	14135
88	315	1	14136
127	316	1	13887
81	317	1	13928
154	318	1	14137
68	319	1	14138
38	319	1	14138
94	320	1	14139
41	321	1	13874
42	321	1	13874
47	322	1	14091
50	323	1	13928
139	324	1	14140
145	325	1	14141
132	326	1	14142
37	327	1	14143
150	328	1	14144
97	330	1	14145
166	330	1	14146
32	331	1	14147
113	332	1	14148
63	333	1	13901
67	334	1	13893
56	334	1	14149
114	335	1	14150
160	336	1	13988
79	337	1	14151
67	338	1	14152
171	339	1	14153
22	339	1	14154
137	340	1	14155
155	340	1	14155
37	341	1	13847
158	342	1	14113
84	343	1	14156
53	344	1	14157
61	345	1	14158
69	346	1	14159
140	347	1	14160
65	348	1	14161
61	349	1	13946
123	349	1	14162
8	350	1	13873
132	351	1	14163
140	352	1	13873
56	353	1	14164
126	354	1	14010
45	22	1	14165
171	22	1	14166
61	22	1	14165
13	355	1	14167
61	355	1	13901
130	356	1	14168
164	357	1	14169
169	358	1	14010
171	47	1	13854
82	47	1	14170
61	47	1	14171
85	47	1	14172
91	47	1	13948
125	359	1	14173
117	359	1	14173
134	359	1	14173
133	359	1	14173
171	359	1	14173
110	359	1	14173
100	359	1	14173
147	359	1	14173
145	359	1	14173
142	359	1	14173
109	359	1	14173
34	360	1	13901
171	360	1	13901
126	361	1	13902
59	362	1	14174
129	363	1	14175
138	364	1	14176
12	365	1	14177
155	366	1	14068
67	367	1	14178
169	367	1	14179
35	368	1	14078
76	369	1	14180
95	370	1	14059
141	371	1	13846
165	372	1	14002
74	373	1	13970
16	374	1	14181
87	375	1	14182
103	375	1	14022
51	376	1	14183
61	376	1	14183
161	377	1	13928
125	379	1	14184
64	379	1	14185
58	380	1	13965
154	381	1	14096
160	382	1	14059
150	383	1	14186
133	383	1	14186
171	383	1	14186
91	383	1	14186
89	383	1	13895
111	383	1	14186
116	384	1	14187
80	385	1	14188
159	386	1	14189
103	387	1	13853
171	388	1	14190
113	388	1	14191
171	389	1	14192
153	390	1	14193
141	391	1	14194
99	392	1	14195
143	393	1	13887
147	394	1	14196
61	394	1	13853
125	395	1	14197
166	396	1	14198
144	397	1	14199
136	398	1	13901
154	399	1	14200
171	400	1	14201
92	401	1	14202
168	402	1	14203
82	403	1	14140
74	404	1	14204
106	405	1	13901
169	405	1	14205
150	406	1	14206
151	406	1	14207
160	407	1	14208
140	408	1	13985
157	409	1	14209
106	410	1	14210
35	411	1	14211
65	412	1	14212
155	413	1	14213
89	414	1	13954
169	415	1	14214
80	416	1	14215
70	416	1	14215
82	416	1	14215
171	417	1	14216
100	417	1	14217
147	39	1	14093
148	39	1	13938
145	418	1	13993
31	419	1	14218
68	420	1	14219
128	421	1	14220
139	422	1	13939
77	422	1	14221
27	423	1	14222
97	424	1	14223
125	425	1	13935
130	426	1	14224
165	427	1	14225
92	428	1	14226
23	429	1	14227
76	430	1	14228
61	431	1	13946
97	23	1	14229
171	432	1	14073
92	433	1	14230
137	434	1	14052
69	434	1	14052
157	434	1	14052
84	434	1	14052
153	434	1	14052
166	434	1	14052
125	434	1	14052
34	434	1	14052
150	434	1	14052
124	434	1	14052
162	434	1	14052
135	434	1	14052
103	434	1	14052
101	434	1	14052
106	434	1	14052
171	434	1	14052
154	434	1	14052
39	434	1	14052
94	434	1	14052
67	434	1	14052
75	434	1	14052
155	434	1	14052
147	434	1	14052
148	434	1	14052
68	434	1	14052
56	434	1	14052
132	434	1	14052
38	434	1	14052
51	434	1	14052
61	434	1	14052
41	434	1	14052
113	434	1	14052
143	434	1	14052
79	434	1	14052
161	434	1	14052
95	434	1	14052
118	434	1	14052
120	434	1	14052
65	434	1	14052
129	434	1	14052
111	434	1	14052
32	434	1	14052
93	434	1	14052
42	434	1	14052
52	435	1	14121
160	46	1	14121
171	46	1	13854
147	46	1	14231
148	436	1	14232
39	437	1	14233
104	438	1	14234
35	439	1	14164
154	440	1	13846
68	441	1	14235
72	442	1	14236
52	443	1	14237
17	444	1	14238
98	445	1	14000
104	446	1	14030
16	447	1	14239
125	448	1	14240
106	448	1	14241
102	448	1	14242
91	448	1	13948
122	449	1	14243
78	450	1	14244
130	451	1	14245
15	452	1	14246
147	453	1	14247
78	454	1	14248
30	455	1	14249
50	456	1	14250
92	456	1	14251
113	457	1	14252
43	458	1	14099
145	459	1	14253
104	460	1	14254
80	460	1	14255
120	461	1	13901
135	462	1	13935
22	463	1	14256
35	464	1	14257
166	465	1	14258
101	465	1	14258
171	465	1	14258
64	465	1	14258
98	465	1	14258
132	465	1	14258
20	465	1	14259
41	465	1	14258
85	465	1	14258
7	465	1	14258
120	465	1	14258
42	465	1	14258
43	465	1	14258
44	465	1	14258
78	465	1	14258
18	466	1	14260
130	467	1	14048
136	468	1	13901
159	469	1	14261
66	470	1	14262
84	471	1	14263
158	472	1	14264
116	473	1	14265
146	473	1	14266
18	474	1	14267
116	475	1	14268
61	476	1	14171
110	477	1	14269
140	478	1	14270
121	479	1	14271
71	480	1	14272
76	480	1	14272
39	481	1	14273
40	481	1	14274
88	482	1	14275
95	483	1	14276
112	484	1	13846
61	485	1	14171
71	486	1	14104
5	486	1	14277
119	487	1	14240
113	488	1	14278
21	489	1	14279
171	490	1	14280
107	490	1	14280
152	490	1	14281
97	491	1	14282
137	492	1	14032
157	493	1	13847
67	494	1	14283
152	495	1	14284
159	496	1	14285
36	497	1	14215
79	498	1	13922
125	499	1	14286
132	499	1	14184
113	499	1	13973
149	499	1	13901
136	500	1	14287
128	500	1	14060
55	500	1	13873
89	500	1	14288
111	500	1	14289
78	500	1	13999
97	501	1	14229
168	502	1	14255
55	502	1	14290
165	503	1	14291
160	504	1	14292
133	505	1	14185
76	506	1	14293
71	507	1	14294
113	508	1	14295
149	509	1	14170
127	510	1	14296
146	511	1	13966
91	512	1	14297
54	513	1	13954
153	514	1	14298
166	514	1	14298
119	514	1	14298
101	514	1	14298
144	514	1	14298
171	514	1	14298
98	514	1	14298
138	514	1	14298
139	514	1	14298
55	514	1	14298
20	514	1	14298
61	514	1	14298
7	514	1	14299
79	514	1	14298
120	514	1	14298
141	514	1	14298
43	514	1	14298
44	514	1	14299
78	514	1	14298
164	514	1	14298
11	515	1	14300
104	516	1	14301
82	517	1	14302
50	518	1	14032
61	518	1	13941
59	519	1	14303
162	520	1	14121
16	521	1	13846
168	522	1	14304
130	523	1	14305
115	524	1	14219
152	524	1	14306
160	525	1	14307
165	526	1	14304
118	527	1	14230
159	528	1	14308
105	529	1	14309
123	529	1	14310
34	530	1	13901
143	531	1	14161
108	532	1	14311
41	533	1	14312
42	533	1	14313
43	533	1	14314
44	533	1	14314
50	534	1	13911
24	534	1	13997
87	534	1	14315
99	534	1	14316
80	534	1	14317
108	534	1	14318
139	534	1	13939
148	534	1	13846
55	534	1	13870
41	534	1	14319
12	534	1	14270
65	534	1	14320
92	535	1	14321
109	536	1	14322
98	537	1	14323
157	538	1	14324
98	539	1	14325
69	6	1	14326
61	6	1	13941
114	6	1	13975
30	6	1	14327
126	6	1	14328
40	540	1	14329
125	541	1	14243
111	542	1	14330
121	543	1	14331
108	543	1	14332
108	544	1	14333
111	545	1	14070
27	546	1	13911
144	547	1	14334
110	547	1	14335
98	547	1	14336
99	548	1	13909
68	549	1	14007
91	550	1	13948
171	551	1	14337
134	552	1	14338
128	553	1	14339
147	554	1	13890
145	554	1	13890
16	555	1	14340
63	555	1	14341
169	556	1	14342
82	557	1	14343
11	558	1	14300
40	559	1	14344
171	560	1	13846
156	561	1	14345
136	562	1	14346
117	562	1	14346
171	562	1	14346
122	562	1	14346
108	562	1	14346
40	563	1	14111
57	564	1	14347
141	565	1	14348
71	566	1	14349
167	567	1	14350
57	568	1	14351
75	569	1	14352
40	570	1	14353
169	571	1	14354
130	572	1	14355
163	573	1	14356
67	574	1	14178
69	575	1	13862
29	576	1	14357
59	577	1	14358
30	578	1	14230
145	579	1	14359
108	580	1	14226
59	581	1	14059
84	582	1	14360
20	583	1	14361
66	584	1	14362
52	585	1	14363
74	586	1	13935
40	587	1	14364
125	588	1	14365
99	589	1	14366
97	590	1	14367
131	591	1	14368
158	592	1	14369
166	592	1	14369
125	592	1	14370
117	592	1	14370
162	592	1	14369
135	592	1	14369
144	592	1	14369
171	592	1	14369
128	592	1	14369
122	592	1	14370
167	592	1	14369
155	592	1	14369
139	592	1	14369
148	592	1	14369
112	592	1	14370
120	592	1	14370
149	592	1	14369
142	592	1	14369
105	592	1	14370
141	592	1	14369
137	593	1	13954
109	594	1	13901
106	595	1	13874
171	595	1	14371
95	596	1	14372
95	597	1	14070
136	598	1	13968
61	599	1	14373
119	600	1	14374
46	601	1	14272
87	602	1	13935
60	603	1	14375
61	603	1	14375
61	604	1	13946
128	605	1	14208
171	606	1	14376
61	606	1	14377
41	606	1	14378
42	606	1	14377
48	606	1	14377
131	607	1	13871
139	607	1	13939
148	607	1	14379
61	607	1	13946
77	607	1	14380
149	607	1	14170
45	608	1	13865
169	609	1	14381
111	609	1	14014
114	609	1	14381
132	610	1	14382
150	611	1	14103
166	613	1	13868
114	614	1	14267
151	615	1	14383
79	616	1	14384
28	617	1	14385
166	618	1	14386
107	619	1	13847
138	620	1	14387
15	621	1	13981
26	622	1	14388
123	623	1	13897
83	624	1	14389
82	624	1	13901
4	625	1	14070
27	625	1	13928
171	626	1	14390
134	627	1	14391
171	628	1	14392
137	629	1	14359
74	629	1	14393
61	630	1	14394
10	631	1	14395
134	632	1	14396
87	633	1	13846
140	634	1	14397
161	635	1	14398
15	636	1	14399
61	637	1	14171
125	638	1	14400
69	639	1	14401
52	640	1	14194
60	641	1	14014
165	642	1	14402
13	643	1	14403
104	644	1	14404
138	645	1	14073
69	27	1	14048
34	646	1	14215
132	647	1	14405
27	648	1	13965
46	649	1	14406
74	650	1	14407
111	651	1	14070
128	652	1	14408
82	653	1	14409
95	653	1	14409
65	653	1	14409
91	654	1	14410
78	655	1	14411
171	656	1	14412
127	656	1	13853
58	656	1	13853
149	656	1	13853
166	657	1	14413
88	658	1	14414
60	659	1	14222
171	660	1	14415
85	661	1	14416
55	662	1	14417
37	663	1	14418
79	664	1	14419
130	665	1	14420
30	666	1	14421
85	667	1	14422
141	668	1	14423
145	669	1	13889
118	670	1	14424
1	671	1	14425
96	671	1	14426
4	671	1	14427
136	671	1	14426
50	671	1	14427
28	671	1	14427
137	671	1	14426
10	671	1	14427
158	671	1	14426
15	671	1	14427
69	671	1	14427
97	671	1	14426
157	671	1	14426
84	671	1	14427
130	671	1	14426
153	671	1	14426
166	671	1	14426
125	671	1	14426
34	671	1	14426
66	671	1	14427
45	671	1	14427
165	671	1	14426
17	671	1	14427
150	671	1	14426
117	671	1	14426
119	671	1	14426
24	671	1	14427
124	671	1	14426
162	671	1	14426
83	671	1	14427
134	671	1	14426
46	671	1	14427
135	671	1	14426
16	671	1	14427
86	671	1	14427
170	671	1	14426
71	671	1	14427
140	671	1	14426
49	671	1	14427
72	671	1	14427
87	671	1	14427
14	671	1	14427
160	671	1	14426
74	671	1	14427
103	671	1	14426
21	671	1	14427
121	671	1	14426
101	671	1	14426
99	671	1	14426
106	671	1	14426
144	671	1	14426
6	671	1	14427
104	671	1	14426
133	671	1	14426
171	671	1	14426
80	671	1	14427
33	671	1	14427
128	671	1	14426
122	671	1	14426
167	671	1	14426
102	671	1	14426
64	671	1	14427
36	671	1	14427
115	671	1	14426
88	671	1	14427
81	671	1	14427
60	671	1	14427
13	671	1	14427
110	671	1	14426
57	671	1	14427
127	671	1	14426
8	671	1	14427
100	671	1	14426
58	671	1	14427
154	671	1	14426
39	671	1	14427
98	671	1	14426
94	671	1	14426
37	671	1	14427
22	671	1	14427
35	671	1	14427
67	671	1	14427
138	671	1	14426
131	671	1	14426
108	671	1	14426
168	671	1	14426
62	671	1	14427
75	671	1	14427
70	671	1	14427
155	671	1	14426
147	671	1	14426
90	671	1	14427
139	671	1	14426
52	671	1	14427
148	671	1	14426
145	671	1	14426
68	671	1	14427
26	671	1	14427
18	671	1	14427
56	671	1	14427
47	671	1	14427
82	671	1	14427
55	671	1	14427
132	671	1	14426
23	671	1	14427
38	671	1	14427
20	671	1	14427
31	671	1	14427
9	671	1	14427
51	671	1	14427
76	671	1	14427
61	671	1	14427
41	671	1	14426
85	671	1	14427
7	671	1	14427
113	671	1	14426
107	671	1	14426
143	671	1	14426
169	671	1	14426
63	671	1	14427
92	671	1	14427
79	671	1	14427
29	671	1	14427
12	671	1	14427
161	671	1	14426
3	671	1	14427
116	671	1	14426
95	671	1	14426
112	671	1	14426
91	671	1	14427
152	671	1	14426
118	671	1	14426
54	671	1	14427
120	671	1	14426
156	671	1	14426
59	671	1	14427
65	671	1	14427
129	671	1	14426
89	671	1	14427
111	671	1	14426
114	671	1	14426
2	671	1	14425
73	671	1	14427
77	671	1	14427
11	671	1	14427
5	671	1	14427
27	671	1	14427
159	671	1	14426
163	671	1	14426
30	671	1	14427
32	671	1	14427
149	671	1	14426
142	671	1	14426
93	671	1	14427
25	671	1	14427
42	671	1	14427
40	671	1	14427
19	671	1	14427
105	671	1	14426
141	671	1	14426
48	671	1	14427
53	671	1	14427
151	671	1	14426
126	671	1	14426
43	671	1	14427
44	671	1	14426
78	671	1	14427
123	671	1	14426
109	671	1	14426
164	671	1	14426
146	671	1	14426
158	672	1	14428
69	672	1	14070
125	672	1	14416
104	672	1	14429
139	672	1	13939
171	673	1	14430
127	674	1	14431
63	675	1	13926
148	676	1	13945
85	677	1	14432
171	678	1	13901
106	679	1	14076
77	680	1	14433
169	681	1	14434
37	682	1	14435
30	683	1	14436
132	684	1	14437
66	685	1	13908
90	686	1	14438
35	687	1	14439
135	688	1	14440
135	689	1	14441
147	24	1	14093
148	24	1	13938
125	690	1	14442
122	691	1	14443
40	692	1	14444
76	693	1	13954
112	694	1	14445
144	695	1	14446
146	696	1	14266
18	697	1	14447
71	698	1	13901
166	699	1	14448
127	700	1	14449
169	701	1	13846
72	702	1	14450
68	703	1	13853
50	704	1	14451
61	705	1	14452
117	706	1	14088
93	707	1	14453
109	707	1	13954
41	708	1	14145
63	708	1	14145
42	708	1	14145
107	709	1	13846
164	710	1	14454
166	711	1	13911
61	712	1	13873
110	713	1	14455
108	714	1	14456
64	715	1	13853
30	716	1	14457
166	717	1	14458
43	718	1	14459
47	719	1	13847
61	720	1	13946
31	721	1	14460
171	722	1	14461
138	722	1	14461
87	723	1	14462
99	723	1	14462
171	723	1	14463
76	723	1	14462
40	724	1	13901
32	725	1	13853
122	726	1	13897
144	727	1	14464
61	728	1	14171
156	729	1	14465
145	730	1	14466
38	730	1	14076
1	3	1	14467
96	3	1	14467
4	3	1	14467
136	3	1	14467
50	3	1	14467
28	3	1	14467
137	3	1	14467
10	3	1	14467
158	3	1	14467
15	3	1	14467
69	3	1	14467
97	3	1	14467
157	3	1	14467
84	3	1	14467
130	3	1	14467
153	3	1	14467
166	3	1	14467
125	3	1	14467
34	3	1	14467
66	3	1	14467
45	3	1	14467
165	3	1	14467
17	3	1	14467
150	3	1	14467
117	3	1	14467
119	3	1	14467
24	3	1	14467
124	3	1	14467
162	3	1	14467
83	3	1	14467
134	3	1	14467
46	3	1	14467
135	3	1	14467
16	3	1	14467
86	3	1	14467
170	3	1	14467
71	3	1	14467
140	3	1	14467
49	3	1	14467
72	3	1	14467
87	3	1	14467
14	3	1	14467
160	3	1	14467
74	3	1	14467
103	3	1	14467
21	3	1	14467
121	3	1	14467
101	3	1	14467
99	3	1	14467
106	3	1	14467
144	3	1	14467
6	3	1	14467
104	3	1	14467
133	3	1	14467
171	3	1	14467
80	3	1	14467
33	3	1	14467
128	3	1	14467
122	3	1	14467
167	3	1	14467
102	3	1	14467
64	3	1	14467
36	3	1	14467
115	3	1	14467
88	3	1	14467
81	3	1	14467
60	3	1	14467
13	3	1	14467
110	3	1	14467
57	3	1	14467
127	3	1	14467
8	3	1	14467
100	3	1	14467
58	3	1	14467
154	3	1	14467
39	3	1	14467
98	3	1	14467
94	3	1	14467
37	3	1	14467
22	3	1	14467
35	3	1	14467
67	3	1	14467
138	3	1	14467
131	3	1	14467
108	3	1	14467
168	3	1	14467
62	3	1	14467
75	3	1	14467
70	3	1	14467
155	3	1	14467
147	3	1	14467
90	3	1	14467
139	3	1	14467
52	3	1	14467
148	3	1	14467
145	3	1	14467
68	3	1	14467
26	3	1	14467
18	3	1	14467
56	3	1	14467
47	3	1	14467
82	3	1	14467
55	3	1	14467
132	3	1	14467
23	3	1	14467
38	3	1	14467
20	3	1	14467
31	3	1	14467
9	3	1	14467
51	3	1	14467
76	3	1	14467
61	3	1	14467
41	3	1	14467
85	3	1	14467
7	3	1	14467
113	3	1	14467
107	3	1	14467
143	3	1	14467
169	3	1	14467
63	3	1	14467
92	3	1	14467
79	3	1	14467
29	3	1	14467
12	3	1	14467
161	3	1	14467
3	3	1	14467
116	3	1	14467
95	3	1	14467
112	3	1	14467
91	3	1	14467
152	3	1	14467
118	3	1	14467
54	3	1	14467
120	3	1	14467
156	3	1	14467
59	3	1	14467
65	3	1	14467
129	3	1	14467
89	3	1	14467
111	3	1	14467
114	3	1	14467
2	3	1	14467
73	3	1	14467
77	3	1	14467
11	3	1	14467
5	3	1	14467
27	3	1	14467
159	3	1	14467
163	3	1	14467
30	3	1	14467
32	3	1	14467
149	3	1	14467
142	3	1	14467
93	3	1	14467
25	3	1	14467
42	3	1	14467
40	3	1	14467
19	3	1	14467
105	3	1	14467
141	3	1	14467
48	3	1	14467
53	3	1	14467
151	3	1	14467
126	3	1	14467
43	3	1	14467
44	3	1	14467
78	3	1	14467
123	3	1	14467
109	3	1	14467
164	3	1	14467
146	3	1	14467
140	731	1	14468
38	731	1	13874
148	732	1	14297
10	733	1	14469
167	734	1	14470
61	735	1	14295
95	735	1	13868
105	735	1	13868
3	736	1	14471
69	737	1	14472
83	738	1	14473
117	739	1	13908
134	740	1	14474
22	741	1	14085
83	742	1	13901
51	743	1	14475
91	744	1	14208
105	745	1	14476
15	746	1	14477
3	746	1	13865
158	747	1	14478
101	748	1	14479
52	21	1	14480
61	21	1	13941
41	21	1	14481
42	21	1	14481
144	749	1	14482
164	749	1	14482
23	750	1	14483
20	750	1	14484
149	750	1	14485
115	751	1	14486
12	752	1	14416
92	753	1	14487
158	754	1	14488
149	755	1	13846
67	756	1	14029
112	757	1	13853
64	758	1	14489
100	759	1	14193
2	760	1	14402
140	761	1	14490
127	762	1	13890
7	763	1	14491
82	764	1	13873
137	765	1	14492
117	765	1	14492
86	765	1	14492
71	765	1	14492
72	765	1	14492
121	765	1	14492
99	765	1	14492
106	765	1	14492
133	765	1	14492
171	765	1	14492
80	765	1	14492
102	765	1	14492
154	765	1	14492
131	765	1	14492
155	765	1	14492
139	765	1	14492
68	765	1	14492
82	765	1	14492
63	765	1	14492
79	765	1	14492
116	765	1	14492
152	765	1	14492
120	765	1	14492
65	765	1	14492
159	765	1	14492
105	765	1	14492
104	35	1	14493
112	35	1	14494
167	766	1	14495
137	767	1	14496
140	768	1	13900
134	769	1	14497
30	770	1	14498
145	771	1	14063
160	772	1	14499
88	773	1	14500
93	774	1	14501
82	775	1	14502
61	776	1	14503
83	777	1	13901
85	777	1	13901
81	778	1	14215
62	779	1	14022
100	780	1	13868
82	781	1	13973
105	782	1	14504
171	783	1	14505
111	783	1	14505
82	784	1	14506
90	785	1	14507
8	786	1	14508
145	787	1	14316
112	788	1	14509
100	789	1	14170
13	790	1	14510
134	791	1	14511
100	792	1	13901
157	793	1	14512
64	794	1	14112
122	795	1	14513
86	796	1	13846
136	797	1	13901
16	798	1	14514
169	799	1	13889
8	800	1	14059
77	801	1	14356
162	802	1	14515
144	802	1	14515
133	802	1	14515
128	802	1	14515
131	802	1	14515
149	802	1	14515
86	803	1	14516
134	804	1	14517
123	805	1	14518
150	806	1	14519
169	807	1	13897
111	807	1	13897
114	807	1	13897
35	808	1	14416
37	809	1	14520
72	810	1	13853
85	811	1	14032
30	812	1	14521
150	813	1	14121
90	814	1	13901
165	815	1	14522
168	815	1	14522
156	815	1	14522
159	815	1	14522
82	816	1	14523
146	817	1	14524
13	818	1	14525
163	819	1	14526
134	820	1	13853
52	821	1	14527
158	822	1	14528
165	822	1	14528
150	822	1	14528
160	822	1	14528
104	822	1	13970
171	822	1	14528
102	822	1	13970
154	822	1	14528
161	822	1	14528
151	822	1	14528
125	823	1	14438
115	823	1	14529
50	824	1	14530
134	825	1	14531
115	826	1	14099
157	827	1	14419
108	828	1	13954
40	829	1	13901
120	830	1	14532
103	831	1	13954
168	832	1	14533
138	833	1	14534
119	834	1	14161
158	835	1	13977
167	835	1	13977
155	835	1	13977
149	835	1	13977
132	836	1	13896
136	837	1	13901
113	838	1	13847
150	839	1	14526
151	839	1	14526
103	840	1	14535
101	840	1	14536
109	841	1	14537
21	842	1	14538
97	843	1	14539
79	844	1	14540
47	845	1	13865
97	846	1	14541
120	847	1	14542
13	848	1	14032
96	849	1	14543
165	849	1	14544
171	849	1	14544
92	849	1	14544
77	849	1	14544
126	849	1	14544
146	849	1	14544
165	850	1	14545
146	850	1	14545
103	851	1	14546
90	851	1	14546
85	851	1	14547
109	851	1	14546
21	852	1	13967
61	853	1	14548
25	853	1	14549
48	853	1	14548
53	853	1	14548
23	854	1	14550
116	855	1	14460
108	856	1	13911
22	857	1	14551
61	858	1	14552
85	858	1	14172
91	858	1	13948
119	859	1	14553
66	860	1	14554
171	861	1	14555
98	862	1	14556
132	863	1	14122
112	864	1	14557
171	865	1	13854
34	866	1	14558
75	867	1	14559
121	868	1	14560
169	868	1	14561
165	869	1	14562
122	870	1	14563
100	871	1	14564
24	872	1	14565
32	873	1	14566
137	874	1	14567
12	875	1	14568
27	875	1	14568
91	876	1	14569
150	877	1	14570
90	877	1	14571
151	877	1	14572
136	878	1	14573
6	879	1	14122
51	880	1	14574
54	881	1	14561
39	882	1	14575
22	883	1	14122
146	884	1	14576
98	885	1	14577
35	886	1	14578
119	887	1	14579
171	887	1	14579
116	887	1	14580
57	888	1	14581
61	889	1	14582
150	890	1	14560
76	891	1	14583
137	892	1	14584
138	893	1	14585
16	894	1	14586
31	894	1	14587
39	895	1	14588
169	896	1	14589
78	897	1	14590
149	898	1	14591
114	899	1	14592
123	900	1	14593
136	901	1	14594
154	902	1	14595
120	903	1	14573
10	904	1	14596
84	904	1	14573
166	904	1	14573
144	904	1	14573
128	904	1	14597
85	904	1	14573
92	904	1	14573
161	904	1	14573
149	904	1	14573
106	905	1	14598
167	906	1	14599
87	907	1	14600
171	908	1	13854
108	908	1	14601
105	909	1	14602
1	910	1	14603
165	911	1	14412
112	912	1	14604
60	913	1	14605
68	914	1	14606
38	914	1	14607
61	915	1	14608
132	916	1	14609
50	917	1	14610
51	917	1	14610
61	917	1	14610
167	918	1	14611
72	919	1	14612
169	920	1	14613
143	921	1	14614
77	922	1	14615
100	923	1	14122
128	924	1	14616
126	924	1	14616
103	925	1	14560
71	926	1	14617
39	926	1	14618
56	927	1	14619
61	927	1	14619
140	928	1	14620
171	929	1	14621
80	929	1	14621
123	930	1	14622
50	931	1	13981
106	932	1	14583
105	933	1	14623
147	934	1	14569
127	935	1	14573
41	935	1	14122
42	935	1	14122
48	935	1	14122
2	936	1	14624
5	936	1	14624
148	937	1	14625
52	938	1	14626
80	939	1	14627
38	940	1	14609
136	941	1	14628
137	941	1	14628
158	941	1	14628
69	941	1	14628
97	941	1	14628
157	941	1	14628
84	941	1	14628
130	941	1	14628
153	941	1	14628
166	941	1	14628
165	941	1	14628
150	941	1	14628
119	941	1	14628
124	941	1	14628
162	941	1	14628
83	941	1	14628
134	941	1	14628
135	941	1	14628
86	941	1	14628
140	941	1	14628
49	941	1	14628
72	941	1	14628
87	941	1	14628
103	941	1	14628
121	941	1	14628
101	941	1	14628
99	941	1	14628
106	941	1	14628
144	941	1	14628
104	941	1	14628
133	941	1	14628
171	941	1	14628
80	941	1	14628
128	941	1	14629
122	941	1	14628
167	941	1	14628
102	941	1	14628
115	941	1	14626
88	941	1	14628
110	941	1	14628
127	941	1	14628
100	941	1	14628
58	941	1	14628
154	941	1	14628
98	941	1	14628
94	941	1	14628
138	941	1	14628
131	941	1	14628
108	941	1	14628
168	941	1	14628
62	941	1	14628
75	941	1	14628
70	941	1	14628
155	941	1	14628
139	941	1	14628
148	941	1	14628
145	941	1	14628
56	941	1	14628
82	941	1	14628
55	941	1	14628
51	941	1	14628
76	941	1	14628
41	941	1	14628
85	941	1	14628
113	941	1	14628
107	941	1	14628
143	941	1	14628
92	941	1	14628
79	941	1	14628
161	941	1	14628
95	941	1	14628
112	941	1	14628
91	941	1	14628
152	941	1	14628
118	941	1	14628
54	941	1	14628
120	941	1	14628
59	941	1	14628
129	941	1	14628
89	941	1	14628
111	941	1	14628
114	941	1	14628
73	941	1	14628
77	941	1	14628
159	941	1	14628
163	941	1	14628
149	941	1	14628
142	941	1	14628
93	941	1	14628
40	941	1	14628
105	941	1	14628
141	941	1	14628
48	941	1	14628
53	941	1	14628
151	941	1	14628
126	941	1	14628
78	941	1	14628
123	941	1	14628
109	941	1	14628
164	941	1	14628
146	941	1	14628
158	942	1	14630
142	942	1	14630
55	943	1	14631
61	943	1	14631
59	943	1	14631
70	944	1	14632
87	945	1	14598
78	946	1	14633
80	947	1	14634
169	948	1	14635
44	949	1	14636
167	44	1	14637
156	950	1	14638
102	951	1	13935
130	952	1	14639
146	953	1	14640
12	954	1	14641
65	954	1	14642
119	955	1	14643
29	956	1	14569
150	957	1	14644
143	957	1	14644
59	958	1	14645
60	959	1	14631
61	959	1	14646
167	960	1	14647
106	961	1	14648
18	962	1	14122
56	963	1	14649
123	964	1	14650
26	965	1	14651
86	966	1	14652
61	967	1	14573
163	968	1	14653
87	969	1	14607
43	969	1	14122
141	970	1	14654
15	971	1	14589
76	971	1	14569
166	972	1	14626
80	973	1	13989
166	974	1	14655
148	974	1	14656
62	975	1	14657
70	975	1	14657
50	976	1	14658
66	977	1	14659
163	978	1	14660
23	979	1	14661
171	980	1	14570
60	980	1	14662
106	981	1	14572
14	982	1	14663
82	982	1	14663
19	982	1	14663
153	983	1	14189
136	984	1	14664
168	985	1	14665
155	986	1	14666
99	987	1	14667
159	988	1	14668
27	989	1	14669
148	990	1	14317
136	991	1	14670
84	992	1	14671
99	993	1	14672
160	994	1	14673
15	995	1	14275
160	996	1	14674
15	997	1	14560
32	998	1	14675
22	999	1	14676
1	1000	1	14677
128	1001	1	14678
127	1001	1	14678
111	1002	1	14570
30	1003	1	14679
18	1004	1	14680
84	1005	1	14681
9	1006	1	14682
2	1007	1	14683
73	1008	1	14684
114	1009	1	14685
147	1010	1	14686
82	1011	1	14578
63	1012	1	14246
78	1013	1	14687
34	1014	1	14688
127	1015	1	13935
149	1015	1	13935
147	1016	1	14689
79	1017	1	14690
162	1018	1	14691
121	1018	1	14691
105	37	1	14602
71	1019	1	14692
85	1020	1	14693
119	1021	1	14694
20	1021	1	14694
64	1022	1	14695
119	1023	1	14696
114	1024	1	14697
167	1025	1	14698
72	1026	1	14699
154	1027	1	14700
52	1027	1	14701
7	1028	1	14702
61	1029	1	14564
53	1029	1	14564
18	1030	1	14703
134	1031	1	14556
69	1032	1	14159
61	1033	1	14704
95	1034	1	14360
20	1035	1	14705
93	1036	1	14573
137	1037	1	14706
117	1037	1	14706
86	1037	1	14706
71	1037	1	14706
49	1037	1	14706
72	1037	1	14706
121	1037	1	14706
99	1037	1	14706
106	1037	1	14706
133	1037	1	14706
171	1037	1	14706
80	1037	1	14706
102	1037	1	14706
60	1037	1	14706
154	1037	1	14706
155	1037	1	14706
139	1037	1	14706
68	1037	1	14706
82	1037	1	14706
55	1037	1	14706
63	1037	1	14706
79	1037	1	14706
116	1037	1	14706
152	1037	1	14706
120	1037	1	14706
65	1037	1	14706
159	1037	1	14706
159	1038	1	14707
171	1039	1	14708
57	1039	1	14708
61	1039	1	14708
52	1040	1	14709
51	1041	1	14710
61	1041	1	14711
54	1041	1	14710
87	1042	1	14712
88	1042	1	14713
132	1043	1	13935
159	1044	1	14714
105	1045	1	14715
144	1046	1	14716
129	1046	1	14716
118	1047	1	14717
163	1048	1	14718
68	1049	1	14564
93	1050	1	14719
118	1051	1	14570
72	1052	1	14720
110	1053	1	14570
10	1054	1	14721
13	1055	1	14722
39	1055	1	14573
60	1056	1	14605
97	1057	1	14723
43	1058	1	14556
124	1059	1	14724
149	1059	1	14570
37	1060	1	14725
45	1061	1	14573
71	1062	1	14726
67	1062	1	14726
62	1062	1	14726
138	1063	1	14727
171	1064	1	14728
151	1065	1	14729
61	1066	1	14608
16	1067	1	14719
135	1068	1	14730
75	1069	1	14731
93	1070	1	14732
72	1071	1	14733
67	1072	1	14668
74	1073	1	14734
116	1073	1	14735
3	1074	1	14559
125	1075	1	14736
121	1075	1	14736
115	1075	1	14736
37	1076	1	14737
157	1077	1	14738
145	1078	1	14604
142	1079	1	14631
136	1080	1	14570
112	1080	1	14570
111	1080	1	14570
149	1080	1	14739
155	1081	1	14607
51	1082	1	14573
40	1082	1	14604
60	1083	1	14740
153	1084	1	14741
26	1085	1	14742
5	1086	1	14573
48	1087	1	14743
6	1088	1	14744
89	1088	1	14745
11	1089	1	14746
50	1090	1	14747
119	1090	1	14748
20	1090	1	14748
79	1090	1	14748
146	1091	1	14671
48	1092	1	14749
4	1093	1	14431
97	1094	1	14750
130	1095	1	14573
71	1095	1	14751
104	1095	1	14573
128	1095	1	14752
122	1095	1	14573
100	1095	1	14048
90	1095	1	14048
38	1095	1	14753
61	1095	1	14608
65	1095	1	14122
32	1095	1	14556
133	1096	1	14754
27	1097	1	14755
133	1098	1	14636
49	1099	1	14756
171	1099	1	14756
61	1099	1	14756
48	1099	1	14756
95	1100	1	14088
127	28	1	14757
98	28	1	14122
112	28	1	14758
60	1101	1	14759
132	1102	1	14556
49	1103	1	14760
93	1104	1	14737
74	1105	1	14761
92	1106	1	14762
91	1106	1	14762
32	1107	1	14763
86	1108	1	14764
171	1109	1	14604
112	1110	1	14758
152	1111	1	14765
96	1112	1	14766
4	1112	1	14766
136	1112	1	14766
50	1112	1	14766
28	1112	1	14766
137	1112	1	14766
10	1112	1	14766
158	1112	1	14766
15	1112	1	14766
69	1112	1	14766
97	1112	1	14766
157	1112	1	14766
84	1112	1	14766
130	1112	1	14766
153	1112	1	14766
166	1112	1	14766
125	1112	1	14766
34	1112	1	14766
66	1112	1	14766
45	1112	1	14766
165	1112	1	14766
17	1112	1	14766
150	1112	1	14766
117	1112	1	14766
119	1112	1	14766
24	1112	1	14766
124	1112	1	14766
162	1112	1	14766
83	1112	1	14766
134	1112	1	14766
46	1112	1	14766
135	1112	1	14766
16	1112	1	14766
86	1112	1	14766
170	1112	1	14766
71	1112	1	14766
140	1112	1	14766
49	1112	1	14766
72	1112	1	14766
87	1112	1	14766
14	1112	1	14766
160	1112	1	14766
74	1112	1	14766
103	1112	1	14766
21	1112	1	14766
121	1112	1	14766
101	1112	1	14766
99	1112	1	14766
106	1112	1	14766
144	1112	1	14766
6	1112	1	14766
104	1112	1	14766
133	1112	1	14766
171	1112	1	14766
80	1112	1	14766
33	1112	1	14766
128	1112	1	14766
122	1112	1	14766
167	1112	1	14766
102	1112	1	14766
64	1112	1	14766
36	1112	1	14766
115	1112	1	14766
88	1112	1	14766
81	1112	1	14766
60	1112	1	14766
13	1112	1	14766
110	1112	1	14766
57	1112	1	14766
127	1112	1	14766
8	1112	1	14766
100	1112	1	14766
58	1112	1	14766
154	1112	1	14766
39	1112	1	14766
98	1112	1	14766
94	1112	1	14766
37	1112	1	14766
22	1112	1	14766
35	1112	1	14766
67	1112	1	14766
138	1112	1	14766
131	1112	1	14766
108	1112	1	14766
168	1112	1	14766
62	1112	1	14766
75	1112	1	14766
70	1112	1	14766
155	1112	1	14766
147	1112	1	14766
90	1112	1	14766
139	1112	1	14766
52	1112	1	14766
148	1112	1	14766
145	1112	1	14766
68	1112	1	14766
26	1112	1	14766
18	1112	1	14766
56	1112	1	14766
47	1112	1	14766
82	1112	1	14766
55	1112	1	14766
132	1112	1	14766
23	1112	1	14766
38	1112	1	14766
20	1112	1	14766
31	1112	1	14766
9	1112	1	14766
51	1112	1	14766
76	1112	1	14766
61	1112	1	14766
41	1112	1	14766
85	1112	1	14766
7	1112	1	14766
113	1112	1	14766
107	1112	1	14766
143	1112	1	14766
169	1112	1	14766
63	1112	1	14766
92	1112	1	14766
79	1112	1	14766
29	1112	1	14766
12	1112	1	14766
161	1112	1	14766
3	1112	1	14766
116	1112	1	14766
95	1112	1	14766
112	1112	1	14766
91	1112	1	14766
152	1112	1	14766
118	1112	1	14766
54	1112	1	14766
120	1112	1	14766
156	1112	1	14766
59	1112	1	14766
65	1112	1	14766
129	1112	1	14766
89	1112	1	14766
111	1112	1	14766
114	1112	1	14766
2	1112	1	14766
73	1112	1	14766
77	1112	1	14766
11	1112	1	14766
5	1112	1	14766
27	1112	1	14766
159	1112	1	14766
163	1112	1	14766
30	1112	1	14766
32	1112	1	14766
149	1112	1	14766
142	1112	1	14766
93	1112	1	14766
25	1112	1	14766
42	1112	1	14766
40	1112	1	14766
19	1112	1	14766
105	1112	1	14766
141	1112	1	14766
48	1112	1	14766
53	1112	1	14766
151	1112	1	14766
126	1112	1	14766
43	1112	1	14766
44	1112	1	14766
78	1112	1	14766
123	1112	1	14766
109	1112	1	14766
164	1112	1	14766
146	1112	1	14766
160	1113	1	14767
140	1114	1	14604
151	1115	1	14768
105	1116	1	14769
45	1117	1	14770
44	1117	1	14764
88	1118	1	14771
83	1119	1	14657
117	1120	1	14583
19	1121	1	14772
147	1122	1	14773
141	1123	1	14715
163	1124	1	14774
98	1125	1	14775
46	1126	1	14776
69	1127	1	14777
140	1128	1	14570
45	1129	1	14607
61	1129	1	14607
76	1130	1	14598
46	1131	1	14122
146	1132	1	14657
55	1133	1	14778
169	1134	1	14779
37	1135	1	14780
106	1136	1	14781
123	1137	1	14782
67	1138	1	14603
63	1139	1	14783
91	1140	1	14682
91	1141	1	14570
158	1142	1	14704
154	1143	1	14784
56	1144	1	14785
168	1145	1	14786
131	1146	1	14590
133	1147	1	14787
36	1148	1	14788
125	1149	1	14570
163	1149	1	14789
13	1150	1	14790
93	1151	1	14603
171	1152	1	14791
63	1152	1	14589
52	1153	1	14792
34	1154	1	14683
144	1154	1	14683
81	1154	1	14683
129	1154	1	14683
121	1155	1	14793
126	1156	1	14794
146	1156	1	14794
157	1157	1	14737
105	1159	1	14578
140	1160	1	14765
105	1161	1	14795
101	1162	1	14687
65	1162	1	14796
47	1163	1	14797
164	1164	1	14700
40	1165	1	14798
66	1166	1	14799
114	1167	1	14565
31	1168	1	14800
166	1169	1	14801
75	1169	1	14802
148	1170	1	14803
57	1171	1	14727
15	1172	1	14275
110	1172	1	14804
137	1173	1	14570
129	1174	1	14680
130	1175	1	14805
10	1176	1	14806
134	1177	1	14807
162	1178	1	14808
88	1179	1	14809
108	1180	1	14810
144	1181	1	14811
129	1182	1	14812
171	1183	1	14813
93	1183	1	14813
106	1184	1	14814
82	1185	1	14671
40	1186	1	14815
164	1187	1	14556
86	1188	1	14816
85	1188	1	14816
49	1189	1	14556
60	1190	1	14605
130	1191	1	14817
107	1192	1	14570
149	1193	1	14818
155	1194	1	14585
71	1195	1	14819
80	1195	1	14819
70	1195	1	14716
79	1195	1	14819
151	1196	1	14677
82	1197	1	14820
99	1198	1	14821
59	1199	1	14774
92	1200	1	14822
9	1201	1	14683
92	1202	1	14823
159	1203	1	14824
146	1203	1	14825
10	1204	1	14826
18	1205	1	14827
27	1206	1	14796
90	1207	1	14576
15	1208	1	14828
98	1209	1	14828
105	1210	1	14829
54	1211	1	14830
66	1212	1	14570
72	1213	1	14831
161	1214	1	14832
166	1215	1	14833
57	1216	1	14834
2	1217	1	14570
48	1218	1	14835
136	1219	1	14836
103	1219	1	14836
10	1220	1	14819
171	1221	1	14683
150	1222	1	14700
99	1223	1	14837
97	1224	1	14838
98	1225	1	14839
163	1225	1	14840
160	1226	1	14569
125	1227	1	14841
82	1228	1	14573
78	1228	1	14573
104	1229	1	14842
149	1230	1	14843
79	1231	1	14844
102	1232	1	14691
27	1233	1	14626
153	1234	1	14845
166	1234	1	14845
119	1234	1	14845
101	1234	1	14845
144	1234	1	14845
171	1234	1	14845
98	1234	1	14845
138	1234	1	14845
139	1234	1	14845
55	1234	1	14845
20	1234	1	14845
61	1234	1	14845
7	1234	1	14846
79	1234	1	14845
120	1234	1	14845
2	1234	1	14576
141	1234	1	14845
43	1234	1	14845
44	1234	1	14846
78	1234	1	14845
164	1234	1	14845
157	1235	1	14847
29	1236	1	14848
139	1237	1	14849
131	1238	1	14850
95	1239	1	14570
36	1240	1	14851
141	1241	1	14704
93	1242	1	14570
81	1243	1	14852
82	1243	1	14852
79	1243	1	14852
122	1244	1	14853
35	1245	1	14854
76	1245	1	14651
148	1246	1	14855
74	1247	1	14856
8	1248	1	14070
146	1249	1	14857
85	1250	1	14858
65	1251	1	14859
119	1252	1	14860
57	1253	1	14861
148	1254	1	14700
30	1255	1	14862
83	1256	1	14863
93	1256	1	14863
136	1257	1	14864
157	1257	1	14864
125	1257	1	14864
117	1257	1	14864
102	1258	1	14865
148	1259	1	13945
34	1260	1	14717
92	1261	1	14570
157	1262	1	14866
45	1262	1	14866
117	1262	1	14866
119	1262	1	14866
46	1262	1	14866
121	1262	1	14866
106	1262	1	14866
122	1262	1	14866
127	1262	1	14866
108	1262	1	14866
47	1262	1	14866
51	1262	1	14866
61	1262	1	14866
41	1262	1	14866
113	1262	1	14866
107	1262	1	14866
116	1262	1	14866
112	1262	1	14866
118	1262	1	14866
59	1262	1	14866
111	1262	1	14866
114	1262	1	14866
42	1262	1	14866
48	1262	1	14866
126	1262	1	14866
43	1262	1	14866
44	1262	1	14866
123	1262	1	14866
49	1263	1	14867
61	1264	1	14868
22	1265	1	14869
144	1266	1	14561
129	1266	1	14561
36	1267	1	14621
40	1267	1	14870
128	1268	1	14871
77	1269	1	14872
141	1270	1	14796
91	1271	1	14873
148	1272	1	14874
154	1273	1	14875
124	1274	1	14876
83	1275	1	14877
87	1276	1	14878
103	1276	1	14878
76	1277	1	14879
10	1278	1	14728
171	1279	1	13854
126	1280	1	14856
117	1281	1	14598
119	1282	1	14578
171	1283	1	14122
109	1284	1	14880
39	1285	1	14881
94	1286	1	14882
171	1287	1	14883
103	1288	1	14884
101	1288	1	14885
164	1289	1	14597
61	1290	1	14806
48	1290	1	14806
130	1291	1	14886
10	1292	1	14887
130	1293	1	14888
74	1294	1	14889
103	1295	1	14890
150	1296	1	14660
165	1297	1	14891
101	1298	1	14892
98	1298	1	14892
85	1298	1	14892
89	1299	1	14893
81	1300	1	14684
128	1301	1	14894
58	1301	1	14895
61	1302	1	14896
146	1303	1	14897
153	1304	1	14898
27	1305	1	14668
87	1306	1	14583
149	1307	1	14578
21	1308	1	14899
171	1309	1	14578
40	1310	1	14900
111	1311	1	14609
33	1312	1	14636
101	1313	1	14867
150	1314	1	14901
111	1315	1	14070
83	1316	1	14902
61	1316	1	14608
11	1316	1	14903
149	1316	1	14660
50	1317	1	14899
150	1318	1	14904
46	1319	1	14638
171	1320	1	14905
142	1321	1	14570
39	1322	1	14906
2	1322	1	14907
48	1323	1	14683
30	1324	1	14908
4	1325	1	14573
3	1325	1	14573
61	1326	1	14909
95	1327	1	14910
98	1328	1	14594
118	1329	1	14911
46	1330	1	14912
171	1330	1	14912
128	1330	1	14912
116	1330	1	14912
164	1330	1	14912
28	1331	1	14913
164	1332	1	14752
103	1333	1	14914
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: seinfeld
--

COPY person (person_id, name, noteable) FROM stdin;
1	Art Wolff	\N
2	Larry David	\N
3	Jerry Seinfeld	\N
4	Tom Cherones	\N
5	Matt Goldman	\N
6	Peter Mehlman	\N
7	Larry Charles	\N
8	David Steinberg	\N
9	Elaine Pope	\N
10	Joshua White	\N
11	Tom Leopold	\N
12	Bob Shaw	\N
13	Don McEnery	\N
14	Bill Masters	\N
15	Larry Levin	\N
16	Marc Jaffe	\N
17	Jason Alexander	\N
18	Greg Daniels	\N
19	Peter Farrelly	\N
20	Bob Farrelly	\N
21	Steve Skrovan	\N
22	Jon Hayman	\N
23	Bruce Kirschbaum	\N
24	Andy Robin	\N
25	Lawrence H. Levy	\N
26	Tom Gammill	\N
27	Max Pross	\N
28	Carol Leifer	\N
29	Ron Hauge	\N
30	Charlie Rubin	\N
31	Andy Cowan	\N
32	Andy Ackerman	\N
33	Alec Berg	\N
34	Jeff Schaffer	\N
35	Fred Stoller	\N
36	David Owen Trainor	\N
37	Marjorie Gross	\N
38	Sam Kass	\N
39	Gregg Kavet	\N
40	Jonathan Gross	\N
41	Spike Feresten	\N
42	David Mandel	\N
43	Matt Selman	\N
44	Jennifer Crittenden	\N
45	Steve O'Donnell	\N
46	Steve Koren	\N
47	Darin Henry	\N
48	Dan O'Keefe	\N
49	Jill Franklyn	\N
50	Bruce Eric Kaplan	\N
51	Billy Kimball	\N
52	Steve Lookner	\N
53	Kit Boss	\N
54	Ian Abercrombie	\N
55	Joshua Abramson	\N
56	George (VI) Adams	\N
57	Walter Addison	\N
58	Craig Adelberg	\N
59	Tom Agna	\N
60	Chris (I) Aguilar	\N
61	Jason (I) Alexander	\N
62	Peter Allas	\N
63	Eddie (III) Allen	\N
64	Brian (I) Altounian	\N
65	Tony (I) Amendola	\N
66	Don Amendolia	\N
67	Stanley Anderson	\N
68	Bret Anthony	\N
69	Perry Anzilotti	\N
70	John Apicella	\N
71	Bill (I) Applebaum	\N
72	Fred (I) Applegate	\N
73	Lee Arenberg	\N
74	Vaughn Armstrong	\N
75	Lewis Arquette	\N
76	Steve Artiaga	\N
77	Pat Asanti	\N
78	Monty Ash	\N
79	Richard Assad	\N
80	Fort Atkinson	\N
81	Cleto Augusto	\N
82	Erick Avari	\N
83	Thomas Azzari	\N
84	Sayed Badreya	\N
85	Tim Bagley	\N
86	Tom (II) Bailey	\N
87	Nick Bakay	\N
88	Bob Balaban	\N
89	Doug Ballard	\N
90	Carl (I) Banks	\N
91	Reuven Bar-Yotam	\N
92	Chris (IX) Barnes	\N
93	Sandy (I) Baron	\N
94	Thom Barry	\N
95	Jeff (II) Barton	\N
96	Joe (I) Basile	\N
97	Billy Bastiani	\N
98	Layne Beamer	\N
99	Lee Bear	\N
100	Walt Beaver	\N
101	Jason (II) Beck	\N
102	Gerry Bednob	\N
103	Drake Bell	\N
104	Tobin Bell	\N
105	Ned Bellamy	\N
106	Mark Beltzman	\N
107	Paul Benedict	\N
108	Langdon Bensing	\N
109	Robby Benson	\N
110	Corbin Bernsen	\N
111	Jerome Betler	\N
112	Jack Betts	\N
113	Raye Birk	\N
114	Jeremiah Birkett	\N
115	Donald Bishop	\N
116	John (I) Bishop	\N
117	David (I) Blackwood	\N
118	Clement Blake	\N
119	David Blasucci	\N
120	Brian Blondell	\N
121	Peter (I) Blood	\N
122	Allen Bloomfield	\N
123	Earl Boen	\N
124	Mark Boone Junior	\N
125	Todd Bosley	\N
126	John (II) Bowman	\N
127	Brian (I) Bradley	\N
128	Steve (II) Brady	\N
129	Larry Braman	\N
130	Bart (I) Braverman	\N
131	Marvin Braverman	\N
132	Danny Breen	\N
133	Eric (I) Brenner	\N
134	Norman Brenner	\N
135	Randy Brenner	\N
136	Jimmy Bridges	\N
137	Lloyd (I) Bridges	\N
138	Wilford Brimley	\N
139	David (I) Brisbin	\N
140	Patrick Bristow	\N
141	Roy Brocksmith	\N
142	Jay (I) Brooks	\N
143	Bill Lee Brown	\N
144	W. Earl Brown	\N
145	Wren T. Brown	\N
146	Johnathan Brownlee	\N
147	Ralph Bruneau	\N
148	Philip Bruns	\N
149	Jim J. Bullock	\N
150	Richard Burgi	\N
151	Scott Burkholder	\N
152	Chris Burmester	\N
153	Stephen Burrows	\N
154	Jeff (I) Bye	\N
155	David (II) Byrd	\N
156	Ron Byron	\N
157	Mark Daniel Cade	\N
158	Stephen (I) Caffrey	\N
159	Neill Calabro	\N
160	Brian (II) Callaway	\N
161	Dayton Callie	\N
162	Ken Hudson Campbell	\N
163	Robb Capielo	\N
164	John Capodice	\N
165	Tony Carlin	\N
166	Steve (I) Carlson	\N
167	Christopher (I) Carroll	\N
168	Earl (II) Carroll	\N
169	Randy (I) Carter	\N
170	Tom Celli	\N
171	David (IV) Chandler	\N
172	Larry (I) Charles	\N
173	Zachary (III) Charles	\N
174	George Cheung	\N
175	Michael Chiklis	\N
176	Glen Chin	\N
177	Chip Chinery	\N
178	Martin Chow	\N
179	Eric Christmas	\N
180	Tory Christopher	\N
181	David (I) Ciminello	\N
182	Anthony Cistaro	\N
183	Kyle Colerider-Krugh	\N
184	Tony Colitti	\N
185	Greg (II) Collins	\N
186	O'Neal Compton	\N
187	Scott Conte	\N
188	Michael D. Conway	\N
189	Pat (I) Cooper	\N
190	Samuel Bliss Cooper	\N
191	Jeff Coopwood	\N
192	Rick Corcoran	\N
193	Dan Cortese	\N
194	Mike Costanza	\N
195	John Cothran Jr.	\N
196	Andy (I) Cowan	\N
197	Bryan Cranston	\N
198	Anthony Crivello	\N
199	Peter (I) Crombie	\N
200	Patrick (I) Cronin	\N
201	Lou Cutell	\N
202	Barry (I) Cutler	\N
203	Charles Cyphers	\N
204	Vito D'Ambrosio	\N
205	John (I) D'Aquino	\N
206	Tom Dahlgren	\N
207	Gregory T. Daniel	\N
208	Christopher Darga	\N
209	Lewis Dauber	\N
210	Larry (I) David	\N
211	Lane Davies	\N
212	Ted (I) Davis	\N
213	Bruce Davison	\N
214	Tim De Zarn	\N
215	James F. Dean	\N
216	Mark DeCarlo	\N
217	Tim DeKay	\N
218	Thomas (I) Dekker	\N
219	John Del Regno	\N
220	Peter Dennis	\N
221	Michael Des Barres	\N
222	Angelo Di Mascio Jr.	\N
223	Barry Diamond	\N
224	Lou DiMaggio	\N
225	Jerry Diner	\N
226	Peter Dinklage	\N
227	Jerry (I) Dixon	\N
228	Steve (I) Doherty	\N
229	Robert Donley	\N
230	Vince Donvito	\N
231	George Doty IV	\N
232	Brian Doyle-Murray	\N
233	Apollo Dukakis	\N
234	David Dunard	\N
235	Kevin (I) Dunn	\N
236	Cedric Duplechain	\N
237	Wayne C. Dvorak	\N
238	Gene Dynarski	\N
239	Steve Eastin	\N
240	Jan Eddy	\N
241	Tony (I) Edwards	\N
242	Paul Eisenhauer	\N
243	David James Elliott	\N
244	Eugene Elman	\N
245	Cary Elwes	\N
246	Charles (I) Emmett	\N
247	Bradford English	\N
248	Van Epperson	\N
249	Bill Erwin	\N
250	Roger Eschbacher	\N
251	Jack (I) Esformes	\N
252	Ron (I) Evans	\N
253	Ross (I) Evans	\N
254	Geoffrey Ewing	\N
255	William Fair	\N
256	Michael (I) Fairman	\N
257	Richard Fancy	\N
258	Al Fann	\N
259	Joe (I) Farago	\N
260	Florinel Fatulescu	\N
261	Jon Favreau	\N
262	Eric (I) Feder	\N
263	Pat (II) Finn	\N
264	Michael (I) Fishman	\N
265	Mark (I) Fite	\N
266	Rick (I) Fitts	\N
267	Markus Flanagan	\N
268	John (I) Fleck	\N
269	Eric Fleeks	\N
270	Dave (I) Florek	\N
271	The Flying Karamazov Brothers	\N
272	Neil (I) Flynn	\N
273	Matthew Fonda	\N
274	Dean Fortunato	\N
275	Jim (I) Fowler	\N
276	Ram�n (I) Franco	\N
277	Art Frankel	\N
278	Steve Franken	\N
279	Walter Franks	\N
280	David Fresco	\N
281	Michael (XI) Friedman	\N
282	Dan Frischman	\N
283	Warren (I) Frost	\N
284	Robert (I) Fuller	\N
285	John (I) Gabriel	\N
286	Courtney Gains	\N
287	Mo Gallini	\N
288	Tom Gallop	\N
289	Tom (I) Gammill	\N
290	Richard Gant	\N
291	Juan (IV) Garc�a	\N
292	Brad (I) Garrett	\N
293	Charley J. Garrett	\N
294	Kyle Gass	\N
295	John Gegenhuber	\N
296	Brian (I) George	\N
297	Joe (I) George	\N
298	George Georgiadis	\N
299	Michael (II) Gerard	\N
300	George Gerdes	\N
301	Daniel Gerroll	\N
302	Donald Gibb	\N
303	Blake Gibbons	\N
304	David (I) Gibbs	\N
305	Nigel Gibbs	\N
306	Steven Marcus Gibbs	\N
307	Joe Gieb	\N
308	Chaim Girafi	\N
309	Fran�ois Giroday	\N
310	Rudolph W. Giuliani	\N
311	Neil Giuntoli	\N
312	Ray Glanzmann	\N
313	Paul (I) Gleason	\N
314	Joe Goddbiff	\N
315	Maurice Godin	\N
316	Fred Goehner	\N
317	Jesse D. Goins	\N
318	Dana Gould	\N
319	John Christian Graas	\N
320	Wayne Grace	\N
321	David (I) Graf	\N
322	Gerrit Graham	\N
323	Jack Graiman	\N
324	Leon W. Grant	\N
325	Vince Grant	\N
326	Bill Gratton	\N
327	Gary (V) Gray	\N
328	Everett Greenbaum	\N
329	Steve Greenstein	\N
330	Jon Gries	\N
331	C.E. Grimes	\N
332	Matthew James Gulbranson	\N
333	Bryant Gumbel	\N
334	Ryal Haakenson	\N
335	Steven Hack	\N
336	Daniel (I) Hagen	\N
337	Mike Hagerty	\N
338	Dylan (I) Haggerty	\N
339	Philip Baker Hall	\N
340	Rick (II) Hall	\N
341	Shashawnee Hall	\N
342	Jack (I) Hallett	\N
343	Dean (I) Hallo	\N
344	John Hamelin	\N
345	Larry Hankin	\N
346	Ellsworth Hanna	\N
347	Mark Harelik	\N
348	Ralph Louis Harris	\N
349	Victor Wayne Harris	\N
350	Harry Hart-Browne	\N
351	Phil (I) Hartman	\N
352	Jeff Hatz	\N
353	Jerry Hauck	\N
354	Allan Havey	\N
355	Pat Hazell	\N
356	Kyle T. Heffner	\N
357	Vic Helford	\N
358	Chip (I) Heller	\N
359	Richard (I) Herd	\N
360	Keith (I) Hernandez	\N
361	J.G. Hertzler	\N
362	Grant Heslov	\N
363	Tommy Redmond Hicks	\N
364	John Michael Higgins	\N
365	John Hillner	\N
366	Brent Hinkley	\N
367	Marc (II) Hirschfeld	\N
368	I.M. Hobson	\N
369	Bernard Hocke	\N
370	Basil Hoffman	\N
371	Steve Hofvendahl	\N
372	Alec (I) Holland	\N
373	Mark (I) Holton	\N
374	James (I) Hong	\N
375	Robert Hooks	\N
376	Nicholas Hormann	\N
377	Fitz Houston	\N
378	Clint Howard	\N
379	Rance Howard	\N
380	Sherman Howard	\N
381	Toby (I) Huss	\N
382	Rif Hutton	\N
383	Steve Hytner	\N
384	Steve (I) Ireland	\N
385	Dom Irrera	\N
386	Amit Itelman	\N
387	William (I) Jackson	\N
388	Carlos Jacott	\N
389	Scott Jaeck	\N
390	Colton James	\N
391	Dublin James	\N
392	Nick Jameson	\N
393	Radmar Agana Jao	\N
394	Bruce Jarchow	\N
395	Harvey Jason	\N
396	Johann John Jean	\N
397	Todd (I) Jeffries	\N
398	Derek Jeter	\N
399	D.A. Johnson	\N
400	Jeffery Thomas Johnson	\N
401	Claude Earl Jones	\N
402	Damon (I) Jones	\N
403	Oscar Jordan	\N
404	S. Marc Jordan	\N
405	Mario Joyner	\N
406	Gordon Jump	\N
407	Michael (I) Kagan	\N
408	Charles Kahlenberg	\N
409	Brian (I) Kaiser	\N
410	Tim (I) Kaiser	\N
411	Aaron Kanarek	\N
412	John Kapelos	\N
413	Brandon (I) Kaplan	\N
414	Michael (V) Kaplan	\N
415	James Karen	\N
416	Hiram Kasten	\N
417	Robert Katims	\N
418	Kevin Keckeisen	\N
419	Steve Kehela	\N
420	Peter Keleghan	\N
421	Robert Louis Kempf	\N
422	Wayne Kennan	\N
423	Dwayne (I) Kennedy	\N
424	Ken Kerman	\N
425	Patrick (I) Kerr	\N
426	Pat Kilbane	\N
427	Daniel Dae Kim	\N
428	Todd (I) Kimsey	\N
429	Carlyle King	\N
430	Robert Kino	\N
431	Dennis (I) Kirkpatrick	\N
432	Scott Klace	\N
433	Spencer (I) Klein	\N
434	Wayne (I) Knight	\N
435	Allan Kolman	\N
436	Barry (I) Kramer	\N
437	Eric Allan Kramer	\N
438	Kenny Kramer	\N
439	Peter (I) Krause	\N
440	Richard Kuhlman	\N
441	Darrell Kunitomi	\N
442	Kay E. Kuter	\N
443	Tom La Grua	\N
444	David Labiosa	\N
445	Carl LaBove	\N
446	Joe Lala	\N
447	Steve Landesberg	\N
448	James Lansbury	\N
449	Norman Large	\N
450	Scott LaRose	\N
451	Mark (II) Larson	\N
452	James Lashly	\N
453	Michael Laskin	\N
454	Nick LaTour	\N
455	Chris Latta	\N
456	Mark Christopher Lawrence	\N
457	Russ Leatherman	\N
458	Brian Leckner	\N
459	Stephen (I) Lee	\N
460	Lawrence LeJohn	\N
461	Jay Leno	\N
462	Wesley Leong	\N
463	Neal Lerner	\N
464	Adam (I) Leslie	\N
465	Len Lesser	\N
466	Jeff (I) Lester	\N
467	James Lesure	\N
468	David Letterman	\N
469	Tracy Letts	\N
470	Charles (I) Levin	\N
471	Jerry Levine	\N
472	Brian (I) Levinson	\N
473	Eugene Lew	\N
474	Joshua Liebling	\N
475	Leonard Lightfoot	\N
476	Warren Littlefield	\N
477	Ernie (I) Lively	\N
478	Richard Livingston	\N
479	John Lizzi	\N
480	Sam (I) Lloyd	\N
481	Ricky Dean Logan	\N
482	Damian London	\N
483	Jon Lovitz	\N
484	Michael Luckerman	\N
485	Rick Ludwin	\N
486	Benjamin Lum	\N
487	Bill Macy	\N
488	Dom Magwili	\N
489	Joseph Maher	\N
490	Bruce Mahler	\N
491	Robert Mailhouse	\N
492	Ossie Mair	\N
493	Shelley Malil	\N
494	Mike (I) Malin	\N
495	Ross Malinger	\N
496	Colin (II) Malone	\N
497	Joseph (I) Malone	\N
498	Jason Manary	\N
499	David (II) Mandel	\N
500	Lawrence Mandley	\N
501	Jon Manfrellotti	\N
502	Anthony Mangano	\N
503	Alex Craig Mann	\N
504	Howard Mann	\N
505	Lynn (I) Manning	\N
506	Paul Mantee	\N
507	Ralph Manza	\N
508	Alec Mapa	\N
509	Jim Marcos	\N
510	Barry Marder	\N
511	Jerry Maren	\N
512	Richard Marion	\N
513	Michael Marisi Ornstein	\N
514	Barney (I) Martin	\N
515	Troy (I) Martin	\N
516	Pierrino Mascarino	\N
517	Fritz Mashimo	\N
518	Bill (II) Masters	\N
519	Raf Mauro	\N
520	Bart (I) McCarthy	\N
521	Kendall (I) McCarthy	\N
522	Colin McClean	\N
523	J. Patrick McCormack	\N
524	Matt (I) McCoy	\N
525	Joel McCrary	\N
526	Suli McCullough	\N
527	Matthew McCurley	\N
528	Kevin (I) McDonald	\N
529	Michael (XI) McDonald	\N
530	Roger McDowell	\N
531	Jack (I) McGee	\N
532	Richard McGonagle	\N
533	Stephen McHattie	\N
534	Deck McKenzie	\N
535	Don (I) McManus	\N
536	Brian (I) McNamara	\N
537	Timothy McNeil	\N
538	Michael (I) McShane	\N
539	Julio Oscar Mechoso	\N
540	Manfred Melcher	\N
541	Nicholas Mele	\N
542	Vince Melocchi	\N
543	Mark Metcalf	\N
544	Paul (I) Michael	\N
545	Michael (II) Michaud	\N
546	Michael Milhoan	\N
547	Jeff (XVIII) Miller	\N
548	Larry (I) Miller	\N
549	Jed Mills	\N
550	Thomas Mills	\N
551	Scott (I) Milne	\N
552	Goh Misawa	\N
553	Herb Mitchell	\N
554	Mitch (IX) Mitchell	\N
555	Michael Mitz	\N
556	Armando Molina	\N
557	Rolando (I) Molina	\N
558	Jarion Monroe	\N
559	Christopher Michael Moore	\N
560	Sean (I) Moran	\N
561	David Moreland	\N
562	Phil (I) Morris	\N
563	Keith (III) Morrison	\N
564	Bruce Ed Morrow	\N
565	David Moscow	\N
566	Irvin Mosley Jr.	\N
567	Oliver Muirhead	\N
568	Kieran Mulroney	\N
569	George (I) Murdock	\N
570	Peter Murnik	\N
571	Bob (II) Murphy	\N
572	Harry S. Murphy	\N
573	Louis Mustillo	\N
574	Brian (I) Myers	\N
575	Ken (II) Myles	\N
576	David Naughton	\N
577	Taylor Negron	\N
578	Chet (II) Nelson	\N
579	Sid Newman	\N
580	James Noah	\N
581	Robert (I) Noble	\N
582	Barry (I) Nolan	\N
583	Roger (I) Nolan	\N
584	Frank Noon	\N
585	Jeff (III) Norman	\N
586	Frank (II) Novak	\N
587	Will (I) Nye	\N
588	Dan (I) O'Connor	\N
589	Raymond (I) O'Connor	\N
590	John F. O'Donohue	\N
591	Tim (I) O'Hare	\N
592	John O'Hurley	\N
593	Kevin J. O'Neill	\N
594	Paul (I) O'Neill	\N
595	Ed O'Ross	\N
596	Ivory Ocean	\N
597	Joe Ochman	\N
598	Bob Odenkirk	\N
599	Jeff Oetjen	\N
600	Walter Olkewicz	\N
601	Timothy Omundson	\N
602	Patton Oswalt	\N
603	Rick Overton	\N
604	Glenn Padnick	\N
605	Robert Padnick	\N
606	Kevin (I) Page	\N
607	Pete G. Papanickolas	\N
608	Tony Papenfuss	\N
609	John Paragon	\N
610	F. William Parker	\N
611	Chris (I) Parnell	\N
612	Peter Parros	\N
613	Pete Pastore	\N
614	Scott (I) Patterson	\N
615	Jarrad Paul	\N
616	Stephen Pearlman	\N
617	Edward Penn	\N
618	Jonathan Penner	\N
619	Kelly Perine	\N
620	Paul (I) Perri	\N
621	Don (I) Perry	\N
622	Joseph V. Perry	\N
623	Zack Phifer	\N
624	Regis Philbin	\N
625	Frank (I) Piazza	\N
626	James Pickens Jr.	\N
627	Dave (I) Pierce	\N
628	John Pinette	\N
629	Fred Pinkard	\N
630	Jeremy Piven	\N
631	Tony Plana	\N
632	Jack Plotnick	\N
633	Jeris Poindexter	\N
634	Joel Polis	\N
635	Jon Polito	\N
636	Vic Polizos	\N
637	Gavin Polone	\N
638	Larry Polson	\N
639	Antony Ponzini	\N
640	Eric Poppick	\N
641	Richard Portnow	\N
642	Brian Posehn	\N
643	John (I) Posey	\N
644	David Powledge	\N
645	Ray Proscia	\N
646	Stephen Prutting	\N
647	David Purdham	\N
648	John Putch	\N
649	Miguel (I) P�rez	\N
650	Amjad J. Qaisen	\N
651	Buddy (I) Quaid	\N
652	Stuart (I) Quan	\N
653	Marty Rackham	\N
654	Will Radford	\N
655	Joseph Ragno	\N
656	Victor Raider-Wexler	\N
657	Andrew Patrick Ralston	\N
658	Phil Ramsey	\N
659	John (I) Randolph	\N
660	James Rebhorn	\N
661	Brian Reddy	\N
662	Ben (I) Reed	\N
663	Elliott Reid	\N
664	Judge Reinhold	\N
665	James Rekart	\N
666	Joe Restivo	\N
667	James (I) Reynolds	\N
668	Jed Rhein	\N
669	Terry Rhoads	\N
670	David (I) Richards	\N
671	Michael (I) Richards	\N
672	David (II) Richardson	\N
673	Peter Riegert	\N
674	John Riggi	\N
675	Terrence Riggins	\N
676	Jack (II) Riley	\N
677	F.J. Rio	\N
678	Geraldo Rivera	\N
679	Mailon Rivera	\N
680	Michael Rivkin	\N
681	Raoul N. Rizik	\N
682	Phil Rizzuto	\N
683	Daryl Keith Roach	\N
684	Richard Roat	\N
685	Tom Alan Robbins	\N
686	Michael Robello	\N
687	Jeremy (I) Roberts	\N
688	Mark (II) Roberts	\N
689	Michael D. Roberts	\N
690	Chuck (I) Robinson	\N
691	Robert Martin Robinson	\N
692	Winston J. Rocha	\N
693	Eamonn Roche	\N
694	Von L. Roddy	\N
695	Marco (I) Rodr�guez	\N
696	David (III) Rogers	\N
697	Paul (I) Rogers	\N
698	Al Roker	\N
699	Ted (I) Rooney	\N
700	Stephen (I) Root	\N
701	Bert Rosario	\N
702	Bill (III) Rose	\N
703	Hugh A. Rose	\N
704	Lenny Rose	\N
705	Roger (I) Rose	\N
706	Arthur Rosenberg	\N
707	Clive Rosengren	\N
708	Ron (I) Ross	\N
709	John (I) Rubano	\N
710	Murray Rubin	\N
711	Kevin Ruf	\N
712	Al Ruscio	\N
713	Leon Russom	\N
714	Kenneth (I) Ryan	\N
715	Michael (I) Saad	\N
716	Ernie Sabella	\N
717	Frank Sackett	\N
718	David (I) Sage	\N
719	Bill Saluga	\N
720	Pete San Filipo Sr.	\N
721	Fred (I) Sanders	\N
722	Miguel (I) Sandoval	\N
723	Reni Santoni	\N
724	Fred Savage	\N
725	Howard Schecter	\N
726	Rob (I) Schneider	\N
727	Earl (I) Schuman	\N
728	Todd (III) Schwartz	\N
729	Larry B. Scott	\N
730	Mik Scriba	\N
731	Stan Sellers	\N
732	Keith Sellon-Wright	\N
733	Glenn Shadix	\N
734	Sam Shamshak	\N
735	Bob (III) Shaw	\N
736	Scott (I) Shaw	\N
737	Jack Shearer	\N
738	Bob (I) Sheppard	\N
739	Armin Shimerman	\N
740	Sab Shimono	\N
741	Harris Shore	\N
742	Buck Showalter	\N
743	Steve (I) Shubert	\N
744	Joseph R. Sicari	\N
745	Johnny (I) Silver	\N
746	George C. Simms	\N
747	Eric (I) Simonson	\N
748	Guy Siner	\N
749	Edgar (I) Small	\N
750	Tucker Smallwood	\N
751	Lionel Mark Smith	\N
752	Marcus Smythe	\N
753	Michael Sorich	\N
754	James Spader	\N
755	Adrian Sparks	\N
756	Jerry Sroka	\N
757	David St. James	\N
758	Timothy (I) Stack	\N
759	Anthony Starke	\N
760	Ron Steelman	\N
761	Ben (I) Stein	\N
762	George M. Steinbrenner III	\N
763	Scott N. Stevens	\N
764	French Stewart	\N
765	Jerry Stiller	\N
766	Peter Stormare	\N
767	Ray Stricklyn	\N
768	Danny Strong	\N
769	James Patrick Stuart	\N
770	Dan Studney	\N
771	Kyle (I) Sullivan	\N
772	Steve Susskind	\N
773	James R. Sweeney	\N
774	Terry (I) Sweeney	\N
775	Ken Takemoto	\N
776	Mark Taormino	\N
777	Danny Tartabull	\N
778	Mark L. Taylor	\N
779	Leonard Termo	\N
780	Iqbal Theba	\N
781	Brady Thomas	\N
782	Craig (I) Thomas	\N
783	Larry (I) Thomas	\N
784	Wesley (I) Thompson	\N
785	Ken Thorley	\N
786	Lawrence Tierney	\N
787	Angelo Tiffe	\N
788	Wayne Tippit	\N
789	Steve Tisch	\N
790	Stephen Tobolowsky	\N
791	Toshi Toda	\N
792	Mel Torm�	\N
793	Shaun Toub	\N
794	Tom Towles	\N
795	Brian Michael Tracy	\N
796	Jack (I) Tracy	\N
797	Alex Trebek	\N
798	David Tress	\N
799	Marcelo Tubert	\N
800	Frantz Turner	\N
801	Mark Tymchyshyn	\N
802	Joe Urla	\N
803	William Utay	\N
804	Tony V.	\N
805	Harry Van Gorkum	\N
806	Frank Van Keeken	\N
807	Yul Vazquez	\N
808	Harley Venton	\N
809	Richard Venture	\N
810	Tom Verica	\N
811	Thom Vernon	\N
812	Barry Vigon	\N
813	Torsten Voges	\N
814	Jon Voight	\N
815	Daniel von Bargen	\N
816	Jeffrey von Meyer	\N
817	Robert (I) Wagner	\N
818	Thomas (I) Wagner	\N
819	Nicholas (I) Walker	\N
820	George (II) Wallace	\N
821	J.D. Walters	\N
822	Patrick Warburton	\N
823	Sandy Ward	\N
824	Allan Wasserman	\N
825	Gedde Watanabe	\N
826	Alan (I) Watt	\N
827	Mathew Weiss	\N
828	David Wendelman	\N
829	George (I) Wendt	\N
830	Ron (I) West	\N
831	Mark Wheatle	\N
832	Sam (I) Whipple	\N
833	Al (I) White	\N
834	Jesse (I) White	\N
835	Wayne Wilderson	\N
836	Bari K. Willerford	\N
837	Bernie Williams	\N
838	Billy (IX) Williams	\N
839	Brian J. Williams	\N
840	Ellis Williams	\N
841	Ian Patrick Williams	\N
842	Tom (I) Williams	\N
843	Mirron E. Willis	\N
844	Dorien Wilson	\N
845	Jason Wingreen	\N
846	Edward Winter	\N
847	Jason (III) Wise	\N
848	Jimmy Woodard	\N
849	Danny Woodburn	\N
850	Henry Woronicz	\N
851	Tom (I) Wright	\N
852	Marvin Wright-Bey	\N
853	Ping (I) Wu	\N
854	Adam Wylie	\N
855	Jeff Yagher	\N
856	Gary (II) Yates	\N
857	Biff (I) Yeager	\N
858	Jeffrey Yerkes	\N
859	Daniel Zacapa	\N
860	Mark Zecca	\N
861	Jim Zulevic	\N
862	Louisa Abernathy	\N
863	Shuko Akune	\N
864	Ellen Albertini Dow	\N
865	Dana (II) Alexander	\N
866	Rae (II) Allen	\N
867	Rosalind Allen	\N
868	Monica Allison	\N
869	Cindy Ambuehl	\N
870	Lisa Arch	\N
871	Alison Armitage	\N
872	Dawn Arnemann	\N
873	Aimee Aro	\N
874	Ren� (I) Ashton	\N
875	Teri Austin	\N
876	Arminae Azarian	\N
877	Nancy Balbirer	\N
878	No�lle Balfour	\N
879	Karen Barcus	\N
880	Blaire Baron	\N
881	Anita Barone	\N
882	Sharon (I) Barr	\N
883	Marie Barrientos	\N
884	Elizabeth Barrington	\N
885	Belinda Barry	\N
886	Jodi Baskerville	\N
887	Frances Bay	\N
888	Susan Beaubian	\N
889	Shirley Beck	\N
890	Erica Y. Becoat	\N
891	Patricia Belcher	\N
892	Diana Bellamy	\N
893	Andrea Bendewald	\N
894	Kate (I) Benton	\N
895	Candice Bergen	\N
896	Jenica Bergere	\N
897	Lili Bernard	\N
898	Denise Bessette	\N
899	Patricia Bethune	\N
900	Shashi Bhatia	\N
901	Tamara Bick	\N
902	Peggy Blow	\N
903	Michelle Bonilla	\N
904	Lauren Bowles	\N
905	Janni Brenn	\N
906	Eve Brenner	\N
907	Beverly C. (II) Brown	\N
908	Carol (IV) Brown	\N
909	Bonnie Bruckheimer	\N
910	Pamela Brull	\N
911	Ursaline Bryant	\N
912	Leesa Bryte	\N
913	Fritzi Burr	\N
914	Maryedith Burrell	\N
915	Elza Camacho	\N
916	Heather (I) Campbell	\N
917	Jennifer (I) Campbell	\N
918	Julia (I) Campbell	\N
919	Kimberly (I) Campbell	\N
920	Helen (I) Carey	\N
921	Seraiah Carol	\N
922	Debbie Lee Carrington	\N
923	Elan Carter	\N
924	Diana Castle	\N
925	Christine Cattell	\N
926	Carissa Channing	\N
927	Lanei Chapman	\N
928	Nancy Linehan Charles	\N
929	Melanie Chartoff	\N
930	Kim (I) Chase	\N
931	Cherie Chetyrbok	\N
932	Cindy (I) Cheung	\N
933	Alexandra Bokyun Chun	\N
934	Maria (I) Cina	\N
935	Julie Claire	\N
936	Lynn (I) Clark	\N
937	Melinda Clarke	\N
938	Molly Cleator	\N
939	Patience Cleveland	\N
940	Shannon Cochran	\N
941	Ruth (I) Cohen	\N
942	Megan (I) Cole	\N
943	Kari Coleman	\N
944	Jennifer Coolidge	\N
945	Tamar (I) Cooper	\N
946	Courteney Cox	\N
947	Veanne Cox	\N
948	Mimi Cozzens	\N
949	Mimi Craven	\N
950	Marcia Cross	\N
951	Yvette Cruise	\N
952	Shireen Crutchfield	\N
953	Suzanne Cryer	\N
954	Patrika Darbo	\N
955	Janice Davies	\N
956	Rachel (III) Davies	\N
957	Kristin (I) Davis	\N
958	Viveka Davis	\N
959	Elizabeth Dennehy	\N
960	Melissa Denton	\N
961	Toni DeRose	\N
962	Flo Di Re	\N
963	Victoria Dillard	\N
964	Pamela Dillman	\N
965	Susan Diol	\N
966	Angela Dohrmann	\N
967	Samantha (I) Dorman	\N
968	Illeana Douglas	\N
969	Denise Dowse	\N
970	Yunoka Doyle	\N
971	Christine Dunford	\N
972	Merrin Dungey	\N
973	Shannon Dunn	\N
974	Sonya Eddy	\N
975	Lisa Edelstein	\N
976	Maggie Egan	\N
977	Jeannie Elias	\N
978	Jennifer Eolin	\N
979	Cynthia Ettinger	\N
980	Donna (I) Evans	\N
981	Renee Faia	\N
982	Siobhan Fallon	\N
983	Yvonne Farrow	\N
984	Meagen Fay	\N
985	Angela Featherstone	\N
986	Arabella Field	\N
987	Edith (I) Fields	\N
988	Karen Fineman	\N
989	Marcia Firesten	\N
990	Victoria Fischer	\N
991	Fern Fitzgerald	\N
992	Michelle (I) Forbes	\N
993	Trudi Forristal	\N
994	Loretta Fox	\N
995	Audrey Frantz	\N
996	Dee Freeman	\N
997	Marla Frees	\N
998	Gina (I) Gallego	\N
999	Ashley (I) Gardner	\N
1000	Lee Garlington	\N
1001	Janeane Garofalo	\N
1002	Ana Gasteyer	\N
1003	Rhoda Gemignani	\N
1004	Liz Georges	\N
1005	Marita Geraghty	\N
1006	Gretchen German	\N
1007	Ellen Gerstein	\N
1008	Jami Gertz	\N
1009	Ileen Getz	\N
1010	Louan Gideon	\N
1011	Kathie Lee Gifford	\N
1012	Kim Gillingham	\N
1013	Rebecca Glenn	\N
1014	Melanie Good	\N
1015	Sue Goodman	\N
1016	Lauren (I) Graham	\N
1017	Rebecca (I) Greene	\N
1018	Kathy Griffin	\N
1019	Kimberly Guerrero	\N
1020	Lisa Guerrero	\N
1021	Ann Morgan Guilbert	\N
1022	Anna (I) Gunn	\N
1023	Annabelle Gurwitch	\N
1024	Jennifer Guthrie	\N
1025	Christina Haag	\N
1026	Molly Hagan	\N
1027	Montrose Hagins	\N
1028	Rozsika Halmos	\N
1029	Maggie Han	\N
1030	Terri Hanauer	\N
1031	Cherie Hankal	\N
1032	Jeanne Hanna	\N
1033	Mariska Hargitay	\N
1034	Dale Harimoto	\N
1035	Magda Harout	\N
1036	Cheryl Francis Harrington	\N
1037	Estelle Harris	\N
1038	Jodi Carol Harrison	\N
1039	Teri Hatcher	\N
1040	Cathy Lind Hayes	\N
1041	Gina Hecht	\N
1042	Jessica Hecht	\N
1043	Lynn A. Henderson	\N
1044	Stacey Herring	\N
1045	Amy (I) Hill	\N
1046	Jill Holden	\N
1047	Shannon Holt	\N
1048	Alex Kapp Horner	\N
1049	Lisa (I) Houle	\N
1050	Jacqueline M. Houston	\N
1051	Cheryl (I) Hunter	\N
1052	Jana Marie Hupp	\N
1053	Susan (I) Isaacs	\N
1054	Jeanine (I) Jackson	\N
1055	Heather James	\N
1056	Norma Janis	\N
1057	Georgann Johnson	\N
1058	Susan Ilene Johnson	\N
1059	Jane A. Johnston	\N
1060	Justine Johnston	\N
1061	O-Lan Jones	\N
1062	Veralyn Jones	\N
1063	Kathryn Joosten	\N
1064	Wendle Josepher	\N
1065	Ella Joyce	\N
1066	Janet Kagan	\N
1067	Judy Kain	\N
1068	Kymberly Kalil	\N
1069	Carol (I) Kane	\N
1070	Jann Karam	\N
1071	Darlene Kardon	\N
1072	Linda Kash	\N
1073	Kathryn Kates	\N
1074	Kimberley Kates	\N
1075	Mary Jo Keenen	\N
1076	Catherine Keener	\N
1077	Jocelyne Kelly	\N
1078	JoNell Kennedy	\N
1079	Shannon (I) Kenny	\N
1080	Judy Kerr	\N
1081	Carol Kiernan	\N
1082	Towanna King	\N
1083	Kathy Kinney	\N
1084	Audrey Kissel	\N
1085	Tawny Kitaen	\N
1086	Jill C. (I) Klein	\N
1087	Jodi Knotts	\N
1088	Tracy Kolis	\N
1089	Nurit Koppel	\N
1090	Annie Korzen	\N
1091	Monica Lacy	\N
1092	Leah Lail	\N
1093	Kimberley LaMarque	\N
1094	Katherine LaNasa	\N
1095	Peggy Lane	\N
1096	A.J. Langer	\N
1097	Bobbi Jo Lathan	\N
1098	Katie (I) Layman	\N
1099	Jane Leeves	\N
1100	Lillian Lehman	\N
1101	Nancy Lenehan	\N
1102	Susan (I) Leslie	\N
1103	Ilana Levine	\N
1104	Charlotte (I) Lewis	\N
1105	Holly (I) Lewis	\N
1106	Vicki (I) Lewis	\N
1107	Mimi Lieber	\N
1108	Lucy Lin	\N
1109	Shawn Lockie	\N
1110	Karen Lorshbough	\N
1111	Lori Loughlin	\N
1112	Julia Louis-Dreyfus	\N
1113	Deirdre Lovejoy	\N
1114	Fatima Lowe	\N
1115	Cindy (I) Lu	\N
1116	June Kyoto Lu	\N
1117	Jessica (I) Lundy	\N
1118	Elina L�wensohn	\N
1119	Marguerite MacIntyre	\N
1120	Cynthia Madvig	\N
1121	Valerie Mahaffey	\N
1122	Victoria Mahoney	\N
1123	Michele Maika	\N
1124	Rosie Malek-Yonan	\N
1125	Wendie Malick	\N
1126	Lisa Malkiewicz	\N
1127	Peggy Maltby	\N
1128	Peggy Mannix	\N
1129	Carol (I) Mansell	\N
1130	Pamela Mant	\N
1131	Vanessa Marquez	\N
1132	Ali Marsh	\N
1133	Paula (I) Marshall	\N
1134	Alison (I) Martin	\N
1135	Marsha (I) Mason	\N
1136	Athena Massey	\N
1137	Gina Mastrogiacomo	\N
1138	Marlee Matlin	\N
1139	Deborah (I) May	\N
1140	Mitzi McCall	\N
1141	Glynis McCants	\N
1142	Kathleen McClellan	\N
1143	Renee McClellan	\N
1144	Edie McClurg	\N
1145	Davenia McFadden	\N
1146	Rebecca (I) McFarland	\N
1147	Gwen McGee	\N
1148	Melinda McGraw	\N
1149	Bonnie McNeil	\N
1150	Sharon McNight	\N
1151	Heather Medway	\N
1152	Wendel Meldrum	\N
1153	Christie Mellor	\N
1154	Lisa Mende	\N
1155	Patricia Messina	\N
1156	Debra Messing	\N
1157	Justine Miceli	\N
1158	Kerry Leigh Michaels	\N
1159	Bette Midler	\N
1160	Ivana Milicevic	\N
1161	Adelaide Miller	\N
1162	Christa Miller	\N
1163	Harriett S. Miller	\N
1164	Jeanette (I) Miller	\N
1165	Debi A. Monahan	\N
1166	Debra Mooney	\N
1167	Susan (III) Moore	\N
1168	Elizabeth Morehead	\N
1169	Heather (I) Morgan	\N
1170	Paige Moss	\N
1171	Megan Mullally	\N
1172	Kate (I) Mulligan	\N
1173	Theresa Mulligan	\N
1174	Kim (I) Myers	\N
1175	Robin (I) Nance	\N
1176	Leslie Neale	\N
1177	Akane Nelson	\N
1178	Tracy (I) Nelson	\N
1179	Lois Nettleton	\N
1180	Kymberly Newberry	\N
1181	Chelsea (I) Noble	\N
1182	Rende Rae Norman	\N
1183	Sheree North	\N
1184	Christine Nyhart	\N
1185	Colette O'Connell	\N
1186	Dyana Ortelli	\N
1187	Catherine Paolone	\N
1188	Kelly Coffield Park	\N
1189	Andrea (I) Parker	\N
1190	Ina Parker	\N
1191	Dana Patrick	\N
1192	Evie Peck	\N
1193	Amanda (I) Peet	\N
1194	Julia Pennington	\N
1195	Lisa (I) Pescia	\N
1196	Sarah (I) Peterson	\N
1197	Dedee Pfeiffer	\N
1198	Barbara Pilavin	\N
1199	Patricia Place	\N
1200	Denise Poirier	\N
1201	Tory Polone	\N
1202	Renee Props	\N
1203	Andrea Ragsdale	\N
1204	Theresa Randle	\N
1205	Dale Raoul	\N
1206	Ellen (I) Ratner	\N
1207	Elsa Raven	\N
1208	Margaret Reed	\N
1209	Rondi Reed	\N
1210	Vonnie C. Rhee	\N
1211	Denise Richards	\N
1212	Tia Riebling	\N
1213	Karen Rizzo	\N
1214	Jennette (I) Robbins	\N
1215	Lesley Robins	\N
1216	Carol Rosenthal	\N
1217	Janet Rotblatt	\N
1218	Derya Ruggles	\N
1219	Debra Jo Rupp	\N
1220	Melody Ryane	\N
1221	McNally Sagal	\N
1222	Connie (I) Sawyer	\N
1223	Toni (I) Sawyer	\N
1224	Joan Scheckel	\N
1225	Mary Scheer	\N
1226	Catherine Schreiber	\N
1227	Karen Lynn Scott	\N
1228	Susan Segal	\N
1229	Katy Selverstone	\N
1230	Molly Shannon	\N
1231	LaRita Shelby	\N
1232	Judith Shelton	\N
1233	Gwen Shepherd	\N
1234	Liz (I) Sheridan	\N
1235	Noor Shic	\N
1236	Bridget Sienna	\N
1237	Sarah Silverman	\N
1238	Vicki Sirotta	\N
1239	Elizabeth Sjoli	\N
1240	Helen Slater	\N
1241	Justine Slater	\N
1242	Tish Smiley	\N
1243	Melanie (I) Smith	\N
1244	Samantha (III) Smith	\N
1245	Suzanne (I) Snyder	\N
1246	Rena Sofer	\N
1247	Suzy Soro	\N
1248	Suanne Spoke	\N
1249	Jill St. John	\N
1250	Rebecca Staab	\N
1251	Maria Stanton	\N
1252	Golde Starger	\N
1253	Peggy (I) Stewart	\N
1254	Viola Kates Stimpson	\N
1255	Barbara Stock	\N
1256	Gail Strickland	\N
1257	Brenda Strong	\N
1258	Marla Sucharetza	\N
1259	Bunny Summers	\N
1260	Carol Ann Susi	\N
1261	Eva (II) Svensson	\N
1262	Heidi Swedberg	\N
1263	Rachel Sweet	\N
1264	Deborah Swisher	\N
1265	Cynthia Szigeti	\N
1266	Jill (I) Talley	\N
1267	Ann Talman	\N
1268	Paige Tamada	\N
1269	Karla Tamburrelli	\N
1270	Christine (I) Taylor	\N
1271	Courtney (I) Taylor	\N
1272	Elayn J. Taylor	\N
1273	Laurie Taylor-Williams	\N
1274	Dylan Tays	\N
1275	Renee Tenison	\N
1276	Diana Theodore	\N
1277	Sunday Theodore	\N
1278	Patricia Ayame Thomson	\N
1279	Daena E. Title	\N
1280	Nicole Tocantins	\N
1281	Marilyn Tokuda	\N
1282	Marisa Tomei	\N
1283	Dianne Travis	\N
1284	Stacey (I) Travis	\N
1285	Nina Tremblay	\N
1286	Jessica Tuck	\N
1287	Myra Turley	\N
1288	Coby Turner	\N
1289	Bahni Turpin	\N
1290	Anne (I) Twomey	\N
1291	Justina Vail	\N
1292	Joan Van Horn	\N
1293	Kristin Bauer van Straten	\N
1294	Kristen Vigrass	\N
1295	Berta Waagfjord	\N
1296	Hilary (I) Wagner	\N
1297	Julie (I) Wagner	\N
1298	Billye Ree Wallace	\N
1299	Linda Wallem	\N
1300	Melora Walters	\N
1301	Susan (I) Walters	\N
1302	Laura Waterbury	\N
1303	Virginia Watson	\N
1304	Kellie Waymire	\N
1305	Melissa Weil	\N
1306	Mari Weiss	\N
1307	Raquel Welch	\N
1308	Kelly Wellman	\N
1309	Jane (II) Wells	\N
1310	Elmarie Wendel	\N
1311	Alexandra Wentworth	\N
1312	Maggie Wheeler	\N
1313	Dana Wheeler-Nicholson	\N
1314	Shannon Whirry	\N
1315	Vivicca A. Whitsett	\N
1316	Karen Wilkie	\N
1317	Karen Denise Williams	\N
1318	Spice Williams-Crosby	\N
1319	Patricia Lee Willson	\N
1320	Gay Thomas Wilson	\N
1321	Jane Edith Wilson	\N
1322	Maud Winchester	\N
1323	Dayna (I) Winston	\N
1324	Jennifer (I) Winter	\N
1325	Anita Wise	\N
1326	Elena Wohl	\N
1327	Barbara Alyn Woods	\N
1328	Wendy Worthington	\N
1329	Lisa Deanne Young	\N
1330	Grace Zabriskie	\N
1331	Janet Zarish	\N
1332	Constance (I) Zimmer	\N
1333	Kim Zimmer	\N
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: seinfeld
--

COPY role (role_id, name) FROM stdin;
1	actor
2	director
3	writer
\.


--
-- Name: key; Type: CONSTRAINT; Schema: public; Owner: seinfeld; Tablespace: 
--

ALTER TABLE ONLY episode
    ADD CONSTRAINT key PRIMARY KEY (episode_id);


--
-- Name: person_id_key; Type: CONSTRAINT; Schema: public; Owner: seinfeld; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_id_key PRIMARY KEY (person_id);


--
-- Name: role_id_key; Type: CONSTRAINT; Schema: public; Owner: seinfeld; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_id_key PRIMARY KEY (role_id);


--
-- PostgreSQL database dump complete
--

