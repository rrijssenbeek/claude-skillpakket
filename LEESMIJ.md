# Skills, deelbaar pakket (voor Ruben)

Dit pakket zet Claude Code in één keer goed neer bij iemand anders. Voor de ontvanger
is `INSTALLEREN.md` het enige dat telt, dit bestand is voor jou.

Het staat op twee plekken:

| Plek | Rol |
|---|---|
| [github.com/rrijssenbeek/claude-skillpakket](https://github.com/rrijssenbeek/claude-skillpakket) (privé) | **Bron van waarheid.** Hier werk je bij. |
| [Drive: 7. Claude Code/Skills](https://drive.google.com/drive/folders/1hq2H_jdJfIn6ldal9lFcK8Exr8RX0cDV) | Kopie, voor wie geen GitHub heeft. |

Lokale werkmap: `~/Projects/claude-skillpakket`.

## Hoe je hem deelt

**Heeft de ander GitHub:** nodig hem uit als collaborator (Settings, Collaborators, of
`gh api -X PUT repos/rrijssenbeek/claude-skillpakket/collaborators/<naam>`). Hij plakt dan:

```bash
git clone https://github.com/rrijssenbeek/claude-skillpakket.git && bash claude-skillpakket/installeer.sh
```

**Heeft de ander geen GitHub:** deel de Drive-map met leesrechten. Hij downloadt hem,
pakt de zip uit en draait `bash installeer.sh`. Zelfde resultaat, één stap meer.

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

Werk altijd in `~/Projects/claude-skillpakket`, nooit rechtstreeks in Drive. Een git-repo
in een sync-map geeft problemen.

Nieuwe skill van je eigen machine erbij zetten:

```bash
rsync -a --exclude '.git' --exclude '*.docx' ~/.claude/skills/<naam>/ ~/Projects/claude-skillpakket/skills/<categorie>/<naam>/
```

Daarna committen, pushen en de Drive-kopie gelijktrekken:

```bash
git -C ~/Projects/claude-skillpakket add -A && git -C ~/Projects/claude-skillpakket commit -m "<wat>" && git -C ~/Projects/claude-skillpakket push
```

```bash
rsync -a --delete --exclude '.git' --exclude '.gitignore' ~/Projects/claude-skillpakket/ "/Users/r_rijssenbeek/Library/CloudStorage/GoogleDrive-ruben@rijssenbeek.info/Mijn Drive/7. Claude Code/Skills/"
```

Let op: die laatste regel gebruikt `--delete` en wist dus de map `_niet-in-pakket/` in
Drive. Die staat bewust niet in de repo. Wil je hem houden, laat `--delete` weg.

Nieuwe plugin erbij? Voeg een regel toe aan de `PLUGINS`-lijst in `installeer.sh`,
in de vorm `marketplace-bron|marketplace-naam|plugin-naam|waarvoor`, en werk de tabel in
`INSTALLEREN.md` bij.

## Wat gecontroleerd is

Het script is getest op een verse installatie én vanaf een schone clone van de repo:
59 skills geplaatst, alle 59 met een geldige `SKILL.md`, en een tweede keer draaien laat
bestaande skills met rust. Het
plugin-deel kon hier niet getest worden, want de `claude` opdracht staat niet op het
pad in deze omgeving. Het script vangt dat geval af en toont dan de commando's om te
plakken. De skills zijn gescand op sleutels en tokens, er staat niets gevoeligs in.
