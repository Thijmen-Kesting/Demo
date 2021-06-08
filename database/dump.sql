--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE shop;
--
-- Name: shop; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE shop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';


\connect shop

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL,
    quantity integer NOT NULL
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    name text NOT NULL,
    "creditCard" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    image text NOT NULL,
    "shortDescription" text NOT NULL,
    "longDescription" text NOT NULL
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price, quantity) FROM stdin;
2	1	2	25952	2
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
1	2021-05-27 12:49:05.671018-07
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription") FROM stdin;
2	At The Gates: Slaughter Of The Soul (1995)	999	/images/at-the-gates-slaughter-of-the-soul.jpg	One of the defining albums of death metal	In 1995, At the Gates released their magnum opus Slaughter of the Soul to the world. It was an album that influenced numerous melodic death metal bands as well as a bunch of cookie cutter metalcore bands. But due to the sheer influence it had on many bands, one could ask as to why this album is widely praised. For starters, every song is among their most well known tracks. All songs on Slaughter of the Soul are killer cuts with no skipping required.
3	Behemoth: The Satanist (2014)	1999	/images/behemoth-the-satanist.jpg	May as well be considered their so-far masterpiece	Crytics all over the world have praised the album for being original, inspired and definitely excellent. Personally, I totally agree: The Satanist is the best blackend death metal record of the decade. It even went gold in Poland. That for sure is saying something.
4	Children Of Bodom: Follow The Reaper (2000)	999	/images/children-of-bodom-follow-the-reaper.jpg	It does not get any better than this	Hatebreeder is for me personally one of the best albums by Children of Bodom. Follow the Reaper is the other one. They are both very similar and yet different albums at the same time. Follow the Reaper has a more modern sound and better production to it. But it is as melodic and a tad more agressive.
5	Death: Scream Bloody Gore (1987)	599	/images/death-scream-bloody-gore.jpg	A major revolution in extreme music	The reason I am giving this album a perfect score is not because of personal reasons, I would not even put it in my top 3 Death albums. However, I think it is objectively and influentially the best Death album, and the greatest death metal album ever recorded in general. Right off the bat, this record is flawless, every song, every riff, every second is just drenched in musical perfection and revolutionary brutality that was completely unheard of prior to its release.
1	Amon Amarth: Berserker (2019)	1999	/images/amon-amarth-berserker.jpg	Soaring upon the wings of eagles	The Swede Vikings are back full-blast. Relentless as ever in their music, or even more ruthless than their more recent albums, they tell the tales of the Ancients and the Timeless ones, with lessons from the rich Viking history. On their eleventh release, the band have finally decided to address head-on the long-present criticism regarding their lack of variation and the sameness of their productions. We have done something quite different as AMON AMARTH, even though very familiar for the fans, Johan Hegg, the much commended vocalist of the band, pointed this out in an interview with Blabbermouth. But it is still gonna sound AMON AMARTH, of course, but there is a lot of new elements and new stuff in the recording. So I think people are gonna be pleasantly surprised about the album.
6	Emperor: In The Nightside Eclipse (1994)	999	/images/emperor-in-the-nightside-eclipse.jpg	Thou art the emperor of darkness	Emperor have always been a unique act among the Norwegian black metal scene. They have always leaned towards a rather epic approach to black metal, and probably they were the very first to do so, not to mention the idea of incorporating in their sound keyboards and orchestrations, thus creating an unmistakeable (and possibly one of the most appealing) brand of extreme music, at least for what is concerning the 90s timespan. This theory may as well be proved by the fact that they are one of the best-selling black metal acts of all times, having sold more than 500,000 copies of their records up to nowadays, something that is really saying something, if you think that they always stayed really true to their roots and their artistic identity, writing music always for the sake of their passion and their beliefs, rather than landing on poppish or commercially winking releases.
7	Mayhem: De Mysteriis Dom Sathanas (1994)	999	/images/mayhem-de-mysteriis-dom-sathanas.jpg	Timeless dark art	It inarguably is an opus magnum of Mayhem. It was released in 1994, after black metal had conquered the Norwegian media for well-known reasons, but the vast part of the De Mysteriis Dom Sathanas material had been circling in the black metal underground since the late 80s in a form of demos, rehearsals, live recordings, so it is fair to call the album a one of the most important in the fundament of black metal.
8	Necrophobic: Dawn Of The Damned (2020)	1999	/images/necrophobic-dawn-of-the-damned.jpg	The forsaken have taken the crown	Band? Institution? Legend? Decide for yourself, but one thing is for sure: Necrophobic do not need to fear any competitor. Since aeons and as mentioned already in a previous review, the Swedish throne of black death metal is fiercely contested, but Dark Funeral are always sleeping too long (one album in the last ten years!), Marduk have many brilliant works, but also a few less strong outputs and Eurynomos or Possession are great, but not Swedish. So maybe it is Necrophobic who are one step ahead of their brothers in spirit? We do not need to find the ultimate answer to this question, just yet...
9	Opeth: Blackwater Park (2001)	999	/images/opeth-blackwater-park.jpg	One of the most polarizing albums of all time	Before anyone listens to an Opeth album, particularly this one, they should be aware of the following: there will be lots of repetition. Opeth is notorious for repeating riffs and other musical ideas for minutes on end. If you want to hear something like Unexpect, where noticeable changes in the melodies occur every 3-5 seconds, this band is not for you. Also, this is not a traditional metal album. Opeth is not focused on sounding brutal, shredding, playing 32nd note double bass kicks at 300 bpm, or any other stereotype associated with black, death, and thrash metal bands.
10	Pantera: Cowboys From Hell (1990)	599	/images/pantera-cowboys-from-hell.jpg	The beginning of an era	Cowboys from Hell is the Pantera that people have come to know and love over the years, whether they were a deep-digging metalhead or just someone who casually enjoyed the genre. It is the album that established their identity and personality. The Abbott brothers, along with Rex and Phil, abandoned their glam aesthetic in favor of a style much more fierce and punishing. They combine the sounds of Judas Priest, Metallica, and a little bit of ZZ Top to respectively show off the catchiness and melody of Priest, the rage, punch and intensity of Metallica, and the groovy, Texan rhythms of ZZ Top to create something that, while familiar as metal, sounded new and energetic. They took thrash and slowed it somewhat to put more of an emphasis on the riffing and rhythmic muscle behind their work. While still yet to evolve into the slug-you-in-the-face variety of groove metal that they would be known for later, there were signs that there was more intensity and punch in the riffs despite being mid-tempo. Cowboys From Hell is an album that goes for the neck and continues delivering punches, showing they can be as fierce as they want, regardless of speed.
11	Slayer: Reign In Blood (1986)	599	/images/slayer-reign-in-blood.jpg	The worst nightmare for a hipster, ultimate paradise for a true metalhead	In the series of me ranting about how much I love metal, we have arrived at the classic album that started the hell raising in my putrid mind. Slayer is definitely the most important band for me when it came to getting into metal and they will always be one of my favorite bands of all time. I am an absolute Slayer geek and it is pretty clear. My nostalgia for this album and Slayer in general is far too extensive to fit into one paragraph, but I will put it all as bluntly as possible. Out of the many metal albums that have influenced me as a musician and a songwriter over the years, Reign In Blood is by far the album that has stuck with me for the longest time. I still vividly remember the first time my young ears heard Tom and his iconic Angel Of Death screech and being absolutely blown away. I had heard Metallica before Slayer as a kid, but Slayer are who really proved to me that metal was something that I was gonna be into for a long time. Slayer at that time felt like a freight train filled with napalm hit my ears at 1000 miles per hour. His deliverance of ENTER TO THE REALM OF SATAN! on Altar Of Sacrifice proved to my 12-year-old brain that you can make such a basic line sound so devastating.
12	Taake: Hordalands Doedskvad (2005)	999	/images/taake-hordalands-doedskvad.jpg	The end of an era	With his third album, the conclusion of the magnificent trilogy that launched Hoest into the upper echelons of black metal artistry, the band seemed to pull off the impossible, the completely unexpected: after the slightest of stumbles with the sophomore, a move that all too often signals an inevitable spiral into artistic bankruptcy or irrelevance, Taake managed to once again tap into the same icy veins Hoest so skillfully mined with the debut. With the production right on point to capture the nuances of the music, Taake once again weaves a tapestry of riffy, powerful distillate of black metal that flows with almost uncanny perfection from one vaguely folky northern melody to the next. Yet again Hoest finds ways to convey the entire spectrum of emotional depths the best black metal bands probe: beauty, wonder, power, pride, despair, romance, hatred, nihilism, longing, and solitude.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 8, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 4, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 1, false);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- PostgreSQL database dump complete
--

