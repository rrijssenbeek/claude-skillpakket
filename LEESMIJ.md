# Skills, deelbaar pakket (voor Ruben)

Deze map is het pakket dat je deelt met iemand bij wie je Claude Code installeert.
Je stuurt de map, de ander draait één script en heeft dan dezelfde skills als jij.

**Deelbare link:** https://drive.google.com/drive/folders/1hq2H_jdJfIn6ldal9lFcK8Exr8RX0cDV

Voor de ontvanger is `INSTALLEREN.md` het enige dat telt. Dit bestand is voor jou.

## Hoe je hem gebruikt

Rechtsklik op de map in Drive, dan Delen, link kopiëren met leesrechten. De ander
downloadt de map, pakt de zip uit en draait `bash installeer.sh`. Meer is het niet.

## Wat erin zit

```
Skills/
├── INSTALLEREN.md            handleiding voor de ontvanger
├── LEESMIJ.md                dit bestand
├── installeer.sh             kopieert skills, installeert plugins
├── skills/                   59 skills in 6 categorieën
│   ├── 01-marketing-en-groei     22
│   ├── 02-design-en-ui           10
│   ├── 03-bouwen-en-code          9
│   ├── 04-werk-en-onderzoek       7
│   ├── 05-video                   4
│   └── 06-caveman                 7
├── Uitleg/                   12 Word-documenten met achtergrond per skill
└── _niet-in-pakket/          3 skills die bewust niet meegaan
```

De categoriemappen zijn alleen voor het overzicht hier. Het script kopieert de skills
plat naar `~/.claude/skills`, want zo verwacht Claude Code ze.

## Wat er bewust niet in zit

**Jouw eigen werkwijze.** De commando's `/handoff`, `/doel`, `/stap`, `/verder`,
`/traject`, `/toegang`, `/werkplekken`, `/loops` en de brein-serie staan in
`~/.claude/commands/`. Ook de agents verkenner, bouwer en controleur, en je
`~/.claude/CLAUDE.md`. Die horen bij jouw systeem, niet bij een buitenstaander. Als je
ooit een teamlid uitrust, is dat een tweede pakket, geen uitbreiding van dit.

**Bedrijfsspecifieke skills.** `nieuwsbericht` en `padelvoorstel` zitten vast aan de
IPA-website, HubSpot en de mailbox. `anti-slop-design` verwijst naar jouw merken en
eerder afgekeurde ontwerpen.

**In `_niet-in-pakket/`:** `albert-dm` (schrijft in andermans stem), `new-client-system`
(gebonden aan een template die de ontvanger niet heeft) en `frontend-design` (zit al
als plugin in het pakket, de losse kopie zou botsen).

**Twee grote repo's.** gstack is 1,1 GB en super-video-maker 261 MB. Die kopieer je niet
via Drive, dat zijn git clones. gstack staat als installatieregel in het script en in de
handleiding. Super-video-maker heb je zelf ook nog niet gebruikt, die heb ik weggelaten.

## Bijwerken

Heb je een nieuwe skill die generiek bruikbaar is, kopieer hem in de juiste categoriemap.
Verandert er iets aan een skill op je eigen machine, dan haal je hem opnieuw op met:

```bash
rsync -a --exclude '.git' --exclude '*.docx' ~/.claude/skills/<naam>/ "/Users/r_rijssenbeek/Library/CloudStorage/GoogleDrive-ruben@rijssenbeek.info/Mijn Drive/7. Claude Code/Skills/skills/<categorie>/<naam>/"
```

Nieuwe plugin erbij? Voeg een regel toe aan de `PLUGINS`-lijst in `installeer.sh`,
in de vorm `marketplace-bron|marketplace-naam|plugin-naam|waarvoor`, en werk de tabel in
`INSTALLEREN.md` bij.

## Wat gecontroleerd is

Het script is getest op een verse installatie: 59 skills geplaatst, alle 59 met een
geldige `SKILL.md`, en een tweede keer draaien laat bestaande skills met rust. Het
plugin-deel kon hier niet getest worden, want de `claude` opdracht staat niet op het
pad in deze omgeving. Het script vangt dat geval af en toont dan de commando's om te
plakken. De skills zijn gescand op sleutels en tokens, er staat niets gevoeligs in.
