# Claude Code skillpakket

59 skills voor Claude Code, in één keer geïnstalleerd. Marketing, design, bouwen,
onderzoek, video en een compacte antwoordmodus.

## Installeren

```bash
git clone https://github.com/rrijssenbeek/claude-skillpakket.git ~/.claude/skillpakket && bash ~/.claude/skillpakket/installeer.sh
```

Sluit Claude Code daarna helemaal af en start hem opnieuw. Skills worden bij het
opstarten ingelezen.

Je hoeft de skills niet aan te roepen: Claude pakt ze vanzelf op zodra het onderwerp
langskomt. Gebeurt dat niet, noem er dan een bij naam ("gebruik de copywriting skill").

| Wat | Hoe |
|---|---|
| Bijwerken | `git -C ~/.claude/skillpakket pull && bash ~/.claude/skillpakket/installeer.sh --overschrijf` |
| Ook tien plugins erbij | `bash ~/.claude/skillpakket/installeer.sh --met-plugins` |
| Bestaande skills met rust laten | dat is de standaard, `--overschrijf` doorbreekt hem |

Het script raakt je plugins niet aan tenzij je `--met-plugins` meegeeft. Regel je die al
via `.claude/settings.json`, laat de vlag dan weg.

## Wat erin zit

| Categorie | Aantal | Waarvoor |
|---|---|---|
| Marketing en groei | 22 | Copy, advertenties, SEO, e-mail, prijsstelling, positionering, PR |
| Design en UI | 10 | Websites bouwen, merkidentiteit, design-tokens, presentaties, designkritiek |
| Bouwen en code | 9 | Beveiliging, schaalbaarheid, kosten, n8n, Trigger.dev, Composio |
| Werk en onderzoek | 7 | Diepteonderzoek, klantenservice, tekst menselijker maken, Upwork |
| Video | 4 | YouTube-thumbnails, clips, B-roll, pop-upgraphics |
| Caveman | 7 | Compacte antwoordmodus, scheelt tot 75% aan tokens |

De meeste skills werken meteen. Een handvol heeft een account of API-sleutel nodig,
en de optionele gstack-suite staat er los bij. Dat staat allemaal in
**[INSTALLEREN.md](INSTALLEREN.md)**.

## Herkomst

De 22 marketingskills komen uit [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) (MIT).
De optionele gstack-suite uit [garrytan/gstack](https://github.com/garrytan/gstack) (MIT).
De overige skills komen uit losse open bronnen en zijn hier verzameld, niet aangepast.
