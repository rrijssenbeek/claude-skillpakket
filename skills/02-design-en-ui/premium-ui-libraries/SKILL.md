---
name: premium-ui-libraries
description: Gebruik dit wanneer we een nieuwe website, landingspagina, hero-sectie, marketing-site, dashboard-UI of redesign bouwen (of een bestaande UI premium/dynamischer moet ogen). Laat Claude proactief meedenken of en waar we animatie- en UI-componenten uit Magic UI, React Bits, Hero UI, unlumen UI of SmoothUI inzetten, met install-recepten per library. Trigger ook bij "bouw een site/landingspagina", "maak dit mooier/duurder", "hero", "animatie op de site".
---

# Premium UI-libraries — meedenken en toepassen

Doel: bij elk nieuw front-end bouwwerk actief afwegen of we een van deze drie gratis React-libraries inzetten om de UI premium en dynamisch te laten ogen. Ruben heeft hier expliciet om gevraagd (26-07-2026): niet stilzwijgend standaard bouwen, maar meedenken en voorstellen.

## Verplichte werkwijze bij een nieuwe site of hero-/landingssectie

1. **Breng het meteen ter sprake.** Voordat je begint met bouwen, benoem kort welke van de drie libraries relevant kan zijn voor déze site en welke concrete componenten (bv. "Magic UI Animated Beam onder de hero", "React Bits Split Text voor de kop", "Hero UI voor de forms"). Wacht niet tot Ruben erom vraagt.
2. **Koppel aan het merk en het doel.** Een effect moet de boodschap dienen, niet afleiden. Stel voor waar het waarde toevoegt, en zeg het eerlijk als een strakke, rustige aanpak beter past.
3. **Laat Ruben kiezen.** Geef een korte aanbeveling, geen eindeloze opsomming. Ruben beslist of we het toepassen.
4. **Design-keuzes blijven op het hoofdmodel** (zie geheugen `model-routing`), ook als je alleen componenten kopieert.

## De libraries — wanneer welke

| Library | Best voor | Aard |
|---|---|---|
| **Magic UI** (magicui.design) | Geanimeerde landingspagina's | Kopieer-componenten (shadcn-stijl, Tailwind + Framer Motion): marquees, animated beams, shimmer, gradiënt-hero's |
| **React Bits** (reactbits.dev) | Creatieve UI-motion / eyecatchers | Kopieer-componenten: tekst-effecten (Split Text, Shiny Text), backgrounds (Aurora, Particles), cursor-effecten. 4 varianten: JS/TS × CSS/Tailwind |
| **unlumen UI** (ui.unlumen.com) | Verfijnde micro-interacties | Kopieer-componenten (shadcn-registry, Tailwind + Motion): sterk getunede animaties voor buttons, tooltips, cursors, previews, plus backgrounds/shaders. Voortgekomen uit Animate UI, focus op timing/easing. Deels Pro (betaald) |
| **SmoothUI** (smoothui.dev) | Kant-en-klare premium blokken | Kopieer-componenten (shadcn-compatibel, Tailwind + Motion): tekst-effecten, buttons, hero-secties, stats-blocks. ~130 gratis componenten, MIT |
| **Hero UI** (heroui.com) | Productie-React-apps | Volwaardige component-library (v3, voorheen NextUI): knoppen, forms, tables, modals, met toegankelijkheid ingebouwd |
| **21st Dev** (21st.dev) | Grote marktplaats van shadcn-blokken/componenten met AI-laag | Kopieer-componenten via het shadcn-registrysysteem (net als Magic UI/React Bits). 12.000+ community-componenten; describe-it-and-generate |

**Strategische regel (belangrijk):** Ruben's designlijn is dynamisch en **custom-built, nooit template-look** (geheugen `ruben-design-voorkeur`).
- **Magic UI, React Bits, unlumen UI en SmoothUI zijn de natuurlijke keuze:** losse effecten en blokken die je selectief als accent bóven op eigen design plakt. Hou het spaarzaam — één sterk effect per sectie, niet alles tegelijk.
- **unlumen UI** blinkt uit in verfijnde, terughoudende micro-interacties (hover/focus/enter/exit) — precies het soort detail dat premium doet ogen zonder kermis. Let op: een deel is Pro/betaald; check per component of het gratis is voordat je erop leunt.
- **Hero UI met een slag om de arm:** als hele library geeft het snel een generieke "kit"-uitstraling. Alleen als basis inzetten wanneer tempo boven eigenheid gaat, en dan stevig herstijlen naar het merk (kleuren, radius, typografie).
- **Bewust weggelaten: RetroUI** (neo-brutalisme / retro-pixel). Botst met Ruben's premium designtaal en wordt door `anti-slop-design` afgekeurd. Niet inzetten.

## Toetsen vóór oplevering
- **Mobiel eerst en performance** (geheugen `mobile-first-design`): zware backgrounds/particles kunnen mobiel traag of batterijvretend zijn. Test op mobiel, overweeg lichtere varianten of `prefers-reduced-motion`.
- **Animaties pauzeerbaar** bij QA (geheugen `browser-qa`).
- **React-first.** Next.js (AMM): alle drie natuurlijk. Astro (IPA): Magic UI / React Bits als React-islands prima; Hero UI minder logisch.

## Install-recepten (pas toe in een echt project, niet globaal)

Deze libraries installeer je **per project**, niet centraal op de Mac. Commando's verouderen — check bij twijfel de officiële install-pagina.

**Magic UI** (vereist Next.js/React + Tailwind + shadcn):
```bash
npx shadcn@latest init          # eenmalig per project
npx shadcn@latest add @magicui/[component]   # bv. @magicui/globe
```
Import daarna uit `@/components/ui/[component]`.

**React Bits** (loopt via shadcn — voeg de registry toe aan `components.json`):
```json
{ "registries": { "@react-bits": "https://reactbits.dev/r/{name}.json" } }
```
```bash
npx shadcn@latest add @react-bits/[Component]   # bv. @react-bits/split-text
```
Bekijk de gewenste component op reactbits.dev; kies variant TS/Tailwind tenzij het project anders is.

**21st Dev** (loopt óók via shadcn — zelfde mechaniek als React Bits):
```json
{ "registries": { "@21st": "https://21st.dev/r/{name}" } }
```
```bash
npx shadcn@latest add "https://21st.dev/r/{component}"   # of via namespace: @21st/[component]
```
Grote marktplaats; kwaliteit wisselt per community-component. Pluk gericht, herstijl naar het merk, en toets net als de rest aan `ruben-design-voorkeur` (nooit template-look).

**unlumen UI** (loopt via shadcn — registry `https://ui.unlumen.com/r/{name}.json`, namespace `@unlumen-ui`):
```bash
npx shadcn@latest add @unlumen-ui/[component]
```
Component-namen check je op ui.unlumen.com. Deels Pro: gratis componenten installeren gewoon; Pro-componenten vragen een licentiesleutel (`?token=${UNLUMEN_LICENSE_KEY}` op de registry-URL). Leun in bouwwerk op de gratis set tenzij Ruben expliciet een licentie wil.

**SmoothUI** (officiële shadcn-registry — namespace `@smoothui`, geen `components.json`-config nodig):
```bash
npx shadcn@latest add @smoothui/[component]   # bv. @smoothui/siri-orb
```
Import daarna uit `@/components/smoothui/ui/[Component]`. ~130 gratis componenten (MIT).

**Hero UI** (v3 — check heroui.com/docs voor de actuele stappen):
```bash
npm install @heroui/react framer-motion
```
Daarna: `<HeroUIProvider>` om de app wikkelen en de HeroUI-plugin in de Tailwind-config zetten. Of gebruik de CLI: `npx heroui-cli@latest init`.

## Diepere integratie: één shadcn MCP-server (de sterkste "in Claude Code"-vorm)
Zowel Magic UI als React Bits lopen via het **shadcn-registrysysteem**. Je hebt dus geen drie losse MCP-servers nodig, maar **één shadcn MCP-server** die alle drie ontsluit. Die leest `components.json` uit de projectmap, dus het is per definitie per-project — activeer hem in een echt React-project, niet globaal.

**Activeren in een bouwproject (één keer):**
1. Zorg dat het project shadcn heeft: `npx shadcn@latest init` (maakt `components.json`).
2. Voeg de registries toe aan `components.json`:
   ```json
   "registries": {
     "@react-bits": "https://reactbits.dev/r/{name}.json",
     "@magicui": "https://magicui.design/r/{name}.json",
     "@21st": "https://21st.dev/r/{name}",
     "@unlumen-ui": "https://ui.unlumen.com/r/{name}.json",
     "@smoothui": "https://smoothui.dev/r/{name}.json"
   }
   ```
3. Voeg de shadcn MCP-server toe: `npx shadcn@latest mcp init --client claude` (schrijft `.mcp.json` in het project). Herstart Claude Code; check met `/mcp` op "Connected".

Daarna kan Claude in natuurlijke taal componenten van shadcn, Magic UI, React Bits, 21st Dev, unlumen UI én SmoothUI browsen en installeren ("voeg de Aurora-background van React Bits toe, maak 'm paars"). Hero UI valt hier buiten (aparte library, eigen npm-pakket).

## Iconen & losse tools (aanvulling)

Naast de component-libraries hierboven horen twee vaste keuzes in de stack. Los van het merk-**beeldmerk** (dat via `logo-iconsystem-standaard` gaat), voor de duizenden *algemene* UI-iconen:

- **Phosphor Icons** — standaard-keuze voor algemene UI-iconen. `npm install @phosphor-icons/react`. 9.000+ iconen, elk in 6 gewichten (`thin`/`light`/`regular`/`bold`/`fill`/`duotone`) via de `weight`-prop, plus `size` en `color`. Tree-shakeable, werkt met React Server Components. Next.js: zet het pakket in `optimizePackageImports` zodat niet de hele set meecompileert. Eén icoonfamilie in zes gewichten dekt vrijwel elke visuele stijl in een app — kies per project één gewicht als basis en hou dat consistent. (shadcn/Lucide blijft prima als default; Phosphor pakken wanneer je meer gewichten of een specifieke stijl wilt.)
- **Animista** (animista.net) — visuele CSS-animatiebouwer: kies een effect, stel duur/easing in, kopieer de keyframes. Geen package, een referentietool. Inzetten voor losse, pure-CSS micro-animaties waar een JS-lib (Framer Motion via Magic UI/React Bits) te zwaar voor is. Toets aan `mobile-first-design` en `prefers-reduced-motion`.

Als Ruben deze libraries in veel projecten gaat gebruiken en de shadcn MCP toch altijd-aan wil, kan hij hem op user-scope zetten (`claude mcp add --scope user shadcn -- npx shadcn@latest mcp`), maar dan werkt hij alleen zinvol in mappen met een `components.json`.

## Bron
Notion-lijst Nico Burkart, "3 Free UI Libraries That Make Your Apps Look Expensive". Zie ook geheugen `ui-libraries-premium-look`. unlumen UI en SmoothUI toegevoegd 10-08-2026 n.a.v. een Reel (`kevin.snippet`, "Top 4 Libraries Every Vibe Coder Should Know"); RetroUI uit diezelfde lijst bewust niet overgenomen (neo-brutalisme, botst met de designtaal).
