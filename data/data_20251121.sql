--
-- PostgreSQL database dump
--

\restrict ijaUfWFE5sSErcg4uW3PzqgmEb1D3X3dNKSbkU1EXWjUbWrcfEJS8ofj7lGczOn

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-11-21 20:20:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4935 (class 0 OID 16454)
-- Dependencies: 219
-- Data for Name: Categoria; Type: TABLE DATA; Schema: public; Owner: videojuegos
--

INSERT INTO public."Categoria" VALUES ('4b29ee91-232d-4671-86ce-82453a9ab9bf', 'Deportes');
INSERT INTO public."Categoria" VALUES ('da80e0b8-21b4-4d4b-bfdb-dc380f74e295', 'Acción');
INSERT INTO public."Categoria" VALUES ('8e8fcd2f-386a-4b38-85d2-d379dd17d026', 'RPG');


--
-- TOC entry 4936 (class 0 OID 16471)
-- Dependencies: 220
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: videojuegos
--



--
-- TOC entry 4937 (class 0 OID 16478)
-- Dependencies: 221
-- Data for Name: Perfil; Type: TABLE DATA; Schema: public; Owner: videojuegos
--



--
-- TOC entry 4938 (class 0 OID 16537)
-- Dependencies: 222
-- Data for Name: Plataforma; Type: TABLE DATA; Schema: public; Owner: videojuegos
--

INSERT INTO public."Plataforma" VALUES ('533ad22a-bf5b-46ef-93bf-397b1c999378', 'PC');
INSERT INTO public."Plataforma" VALUES ('5fc86c36-8cd1-4218-afb8-b076db141b6e', 'PS5');


--
-- TOC entry 4934 (class 0 OID 16446)
-- Dependencies: 218
-- Data for Name: Videojuego; Type: TABLE DATA; Schema: public; Owner: videojuegos
--

INSERT INTO public."Videojuego" VALUES ('be7c1071-0dda-4c3e-8f88-a6a3c5806e6e', 'GTA6', '2025-11-21 20:11:11.459', 'Usado', 'da80e0b8-21b4-4d4b-bfdb-dc380f74e295');
INSERT INTO public."Videojuego" VALUES ('12168b81-fadd-460c-b500-06d6757719fc', 'EA FC 26', '2025-11-21 20:11:11.459', 'Nuevo', '4b29ee91-232d-4671-86ce-82453a9ab9bf');


--
-- TOC entry 4939 (class 0 OID 16544)
-- Dependencies: 223
-- Data for Name: _Videojuego_Plataforma; Type: TABLE DATA; Schema: public; Owner: videojuegos
--

INSERT INTO public."_Videojuego_Plataforma" VALUES ('533ad22a-bf5b-46ef-93bf-397b1c999378', 'be7c1071-0dda-4c3e-8f88-a6a3c5806e6e');
INSERT INTO public."_Videojuego_Plataforma" VALUES ('5fc86c36-8cd1-4218-afb8-b076db141b6e', 'be7c1071-0dda-4c3e-8f88-a6a3c5806e6e');
INSERT INTO public."_Videojuego_Plataforma" VALUES ('533ad22a-bf5b-46ef-93bf-397b1c999378', '12168b81-fadd-460c-b500-06d6757719fc');
INSERT INTO public."_Videojuego_Plataforma" VALUES ('5fc86c36-8cd1-4218-afb8-b076db141b6e', '12168b81-fadd-460c-b500-06d6757719fc');


--
-- TOC entry 4933 (class 0 OID 16437)
-- Dependencies: 217
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: videojuegos
--

INSERT INTO public._prisma_migrations VALUES ('4393feae-5135-4b68-9a2a-c893fa4e268c', 'b220e997bca8038235e9fbe7c1b1520840ff2b2ef50894ff6d4b0182ef763989', '2025-11-21 19:55:23.916328-05', '20251115010258_start', NULL, NULL, '2025-11-21 19:55:23.902856-05', 1);
INSERT INTO public._prisma_migrations VALUES ('8970c10e-5d88-4794-bcbf-4b8c5ecc7b39', 'a330dbe74133848bfb491d60863094f4f6324b5f154525c711265eeaedaacedf', '2025-11-21 19:55:23.963474-05', '20251115024601_relation_categoria', NULL, NULL, '2025-11-21 19:55:23.917288-05', 1);
INSERT INTO public._prisma_migrations VALUES ('7c2da229-5df8-4c4f-84eb-e26003ff277c', '8f1651bed8f082385837def5a346050ce863532127345c24ec3c6ee9d36a3e5a', '2025-11-21 19:55:24.09314-05', '20251120024447_uno_uno', NULL, NULL, '2025-11-21 19:55:23.965695-05', 1);
INSERT INTO public._prisma_migrations VALUES ('128a0467-808e-42a9-b7da-0f706198fac1', '8bd25c7c6b08cb1c9008343141c8d47c0a7f72ee01bbfd86130d2693a4a463b8', '2025-11-21 19:55:26.337694-05', '20251122005526_muchos_muchos', NULL, NULL, '2025-11-21 19:55:26.142701-05', 1);


-- Completed on 2025-11-21 20:20:52

--
-- PostgreSQL database dump complete
--

\unrestrict ijaUfWFE5sSErcg4uW3PzqgmEb1D3X3dNKSbkU1EXWjUbWrcfEJS8ofj7lGczOn

