# Claude Code skillpakket, installeren in 5 minuten

Dit pakket zet 59 skills en 10 plugins in je Claude Code. Skills zijn kant en klare
werkwijzes die Claude vanzelf oppakt zodra het onderwerp langskomt. Je hoeft ze niet
te onthouden of aan te roepen, je vraagt gewoon wat je wilt.

## Wat je eerst nodig hebt

1. **Claude Code** geïnstalleerd. Nog niet? Ga naar [claude.com/claude-code](https://claude.com/claude-code)
   en volg de installatie voor je systeem.
2. Een **terminal** (op Mac: Terminal of iTerm, in Programma's onder Hulpprogramma's).
3. Deze map, gedownload naar je computer. In Google Drive: rechtsklik op de map
   **Skills**, dan Downloaden. Pak de zip uit.

## Installeren

Open de terminal, sleep de uitgepakte map erin om het pad te krijgen, en draai:

```bash
cd ~/Downloads/Skills && bash installeer.sh
```

Het script doet drie dingen:

1. Alle skills kopiëren naar `~/.claude/skills`
2. De plugins installeren via de officiële marketplaces
3. Vertellen hoe je gstack erbij zet (optioneel, grote extra suite)

Staat de `claude` opdracht niet op je systeem, dan slaat het script de plugins over
en toont het de regels die je zelf kunt plakken. Je kunt plugins ook installeren via
het menu `/plugin` binnen Claude Code.

Daarna Claude Code opnieuw opstarten. Klaar.

**Varianten:**

```bash
bash installeer.sh --alleen-skills
```

```bash
bash installeer.sh --overschrijf
```

De eerste slaat de plugins over. De tweede vervangt skills die je al had, zonder die
vlag blijven bestaande skills staan.

## Wat er in het pakket zit

### Marketing en groei (22 skills)

Advertenties, analytics, cold email, community, contentstrategie, copywriting,
conversie-optimalisatie, klantonderzoek, e-mailflows, cold-emailcampagnes in Instantly,
productlanceringen, leadmagneten, marketingplannen, marketingpsychologie, aanbod en
propositie, prijsstelling, positionering, PR, referralprogramma's, SEO-audits en social.

Vraag bijvoorbeeld: *"Schrijf de homepage-copy voor mijn boekhoudsoftware"* of
*"Maak een marketingplan voor het komende kwartaal, budget 5.000 per maand"*.

### Design en UI (10 skills)

Bannerontwerp, merkidentiteit, complete premium websites bouwen (React, Vite, Tailwind,
GSAP), design-tokens, logo's en huisstijl, designkritiek en polish, geanimeerde
UI-componentenbibliotheken, HTML-presentaties met grafieken, shadcn/ui interfaces, en
een zoekbare database met 67 stijlen, 161 kleurpaletten en 57 lettercombinaties.

Vraag bijvoorbeeld: *"Bouw een landingspagina voor mijn dienst"* of
*"Kijk kritisch naar dit scherm en maak het rustiger"*.

### Bouwen en code (9 skills)

Beveiliging, schaalbaarheid, kosten van cloud en infrastructuur omlaag, n8n-automatiseringen,
Trigger.dev-achtergrondtaken, Composio-integraties, zelf skills maken, een pre-edit
controle via Codex, en een kennisgraaf over je codebase.

### Werk en onderzoek (7 skills)

Diepgaand onderzoek met bronvergelijking, klantenservice, tekst menselijker maken,
Claude jou laten leren kennen over sessies heen, zelfverbetering, en twee Upwork-skills
voor profiel en offertes.

### Video (4 skills)

YouTube-thumbnails, korte clips, B-roll en pop-upgraphics. Deze werken via de Higgsfield
MCP, die moet je apart koppelen en die kost per generatie geld.

### Caveman (7 skills)

Een compacte antwoordmodus die het tokengebruik flink terugbrengt zonder inhoud te
verliezen. Aanzetten met `/caveman`, uitzetten met "normal mode".

### Plugins (10)

| Plugin | Waarvoor |
|---|---|
| superpowers | Werkwijzes voor brainstormen, plannen, debuggen en code review |
| episodic-memory | Doorzoekt wat je in eerdere gesprekken hebt besproken |
| superpowers-chrome | Claude kan je browser bedienen |
| frontend-design | Officiële designrichting van Anthropic |
| claude-code-setup | Adviseert hoe je Claude Code inricht voor jouw project |
| ponytail | Dwingt de simpelste oplossing af, tegen overbouwen |
| claude-mem | Geheugen dat over sessies heen blijft hangen |
| notfair | Google Ads, Meta Ads en SEO |
| watch | Video's bekijken en samenvatten |
| claude-council | Tweede mening van ChatGPT, Gemini en Grok naast Claude |

## Wat je nog los moet regelen

De meeste skills werken meteen. Deze hebben nog iets nodig:

| Skill of plugin | Wat je nog moet doen |
|---|---|
| claude-council | API-sleutels van OpenAI, Google en eventueel xAI en Perplexity in je `~/.zshrc`. Zonder sleutels draait alleen de lokale variant. |
| youtube-skills | Higgsfield MCP koppelen. Betaald per generatie. |
| composio, n8n, trigger-dev | Een account bij die dienst en een API-sleutel. |
| instantly-campaign | Instantly-account met API-toegang. |
| graphify | `uv tool install graphifyy`, daarna staat `graphify` in `~/.local/bin`. |
| ui-ux-pro-max | Python 3 op je systeem, voor de zoekfunctie in de database. |
| notfair | Lezen werkt direct. Schrijven naar advertentie-accounts loopt via notfair.co. |

## gstack, de grote optionele suite

Nog eens 34 skills voor browsertesten, QA, deployen, code review en iOS. Ongeveer 1 GB,
daarom niet in dit pakket. Installeren:

```bash
git clone --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack && cd ~/.claude/skills/gstack && ./setup
```

## Werkt iets niet

- **Claude ziet de skills niet.** Claude Code helemaal afsluiten en opnieuw starten.
  Controleer daarna of `~/.claude/skills` de mappen bevat.
- **Het script zegt "claude niet gevonden".** Dat is geen probleem, de skills staan er
  dan wel. Installeer de plugins via het `/plugin` menu binnen Claude Code.
- **Een skill start niet vanzelf.** Noem hem bij naam, bijvoorbeeld
  *"gebruik de copywriting skill hiervoor"*.

## Bronnen

De marketingskills komen uit [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills).
gstack uit [garrytan/gstack](https://github.com/garrytan/gstack). De plugins uit de
marketplaces die in `installeer.sh` staan. De overige skills komen uit losse open bronnen
en zijn hier verzameld, niet aangepast.
