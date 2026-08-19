# Skillpakket (voor Ruben)

Dit pakket zet iemands Claude Code in één handeling vol met jouw skills. Voor de ontvanger
is `README.md` het enige dat telt; dit bestand is voor jou.

**De repo is de enige route.** `github.com/rrijssenbeek/claude-skillpakket` staat sinds
19-08-2026 **publiek**, zodat de installatie één regel is die Claude zelf kan uitvoeren.
Lokale werkmap: `~/Projects/claude-skillpakket`.

Waarom publiek: privé werkte alleen met een uitnodiging per persoon, en de Drive-route
kostte downloaden, uitpakken en een pad opzoeken. Dat was de enige plek in het hele
draaiboek waar iemand buiten de app moest klooien. Kanttekening: zes design-skills
(`brand`, `design`, `design-system`, `slides`, `banner-design`, `impeccable`) hebben geen
vindbare bron of licentie. De marketingskills en gstack zijn MIT.

## Hoe het wordt gebruikt

In het A Mi Manera-dashboard, AI-Fundamenten, **Claude Code inrichten**
(`/ai-fundament/inrichting`). Fase 1 is de eerste batch en bestaat uit twee plak-zinnen:

1. **Startpakket** — de drie kern-plugins via `.claude/settings.json`
2. **Alle skills in één keer** — dit pakket, stap-id `skillpakket`

Die twee mechanismen blijven strikt gescheiden: **plugins komen uit het startpakket,
skills uit dit pakket.** Daarom installeert `installeer.sh` standaard alléén skills. De
plugins zitten achter `--met-plugins` en die vlag hoort niet in het draaiboek thuis.

Caveman, UI UX Pro Max en Humanizer hadden eigen stappen in het draaiboek. Die zijn
verwijderd: ze zitten in dit pakket, dus dat was dubbel.

## Wat erin zit

```
claude-skillpakket/
├── README.md          de installatie, publieke voordeur
├── INSTALLEREN.md     naslag: wat er in zit, wat je per skill nog regelt
├── LEESMIJ.md         dit bestand
├── installeer.sh      kopieert skills; plugins alleen met --met-plugins
├── skills/            59 skills in 6 categorieën
└── Uitleg/            12 Word-documenten met achtergrond per skill
```

Niet meegeleverd: **gstack** (1,1 GB git clone) en **super-video-maker** (261 MB). Die
horen niet in een repo die je bij iemand uitrolt; gstack staat als installatieregel in het
script.

Ook niet meegeleverd, en dat moet zo blijven: jouw eigen commando's (`/handoff`, `/doel`,
`/stap`, de brein-serie), je agents en je `CLAUDE.md`. Een teamlid-pakket is iets anders
dan dit; teamleden lopen via de dashboard/MCP-route.

## Bijwerken

Werk altijd in `~/Projects/claude-skillpakket`, nooit in een Drive-map. Nieuwe skill erbij:

```bash
rsync -a --exclude '.git' --exclude '*.docx' ~/.claude/skills/<naam>/ ~/Projects/claude-skillpakket/skills/<categorie>/<naam>/
```

Daarna committen en pushen. Iedereen die het al heeft haalt het op met:

```bash
git -C ~/.claude/skillpakket pull && bash ~/.claude/skillpakket/installeer.sh --overschrijf
```

Verandert de installatie zelf, werk dan ook stap `skillpakket` bij in
`amimanera-dashboard/lib/fundament/inrichting-draaiboek.ts`.

## De Drive-map

`7. Claude Code/Skills/` in Mijn Drive bevat nog een kopie van 19-08-2026, gedeeld met
"iedereen met de link". Sinds de repo publiek is, is die overbodig en wordt hij niet meer
bijgewerkt. Laat hem staan als archief of gooi hem weg; hij wordt nergens meer genoemd,
niet in het draaiboek en niet in deze repo.
