#!/usr/bin/env bash
# Installeert het skillpakket voor Claude Code.
# Draaien vanuit deze map:  bash installeer.sh          (59 skills)
# Ook de tien plugins erbij: bash installeer.sh --met-plugins
# Bestaande skills vervangen: bash installeer.sh --overschrijf

set -uo pipefail

BRON="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOEL="$HOME/.claude/skills"
MET_PLUGINS=0
OVERSCHRIJF=0
for arg in "$@"; do
  case "$arg" in
    --met-plugins)   MET_PLUGINS=1 ;;
    --alleen-skills) MET_PLUGINS=0 ;;   # standaardgedrag, blijft werken
    --overschrijf)   OVERSCHRIJF=1 ;;
    -h|--help) sed -n '2,6p' "${BASH_SOURCE[0]}"; exit 0 ;;
    *) echo "Onbekende optie: $arg"; exit 1 ;;
  esac
done

groen()  { printf '\033[32m%s\033[0m\n' "$*"; }
geel()   { printf '\033[33m%s\033[0m\n' "$*"; }
kop()    { printf '\n\033[1m%s\033[0m\n' "$*"; }

# ---------------------------------------------------------------- skills ----
kop "1. Skills kopiëren naar $DOEL"
mkdir -p "$DOEL"

nieuw=0; bestond=0; vervangen=0
while IFS= read -r map; do
  naam="$(basename "$map")"
  if [ -d "$DOEL/$naam" ]; then
    if [ "$OVERSCHRIJF" = "1" ]; then
      rm -rf "$DOEL/$naam"; cp -R "$map" "$DOEL/$naam"; vervangen=$((vervangen+1))
    else
      bestond=$((bestond+1))
    fi
  else
    cp -R "$map" "$DOEL/$naam"; nieuw=$((nieuw+1))
  fi
done < <(find "$BRON/skills" -mindepth 2 -maxdepth 2 -type d)

groen "   $nieuw nieuw geïnstalleerd, $vervangen vervangen, $bestond overgeslagen (bestonden al)"
[ "$bestond" -gt 0 ] && geel "   Wil je die overschrijven: bash installeer.sh --overschrijf"

if [ "$MET_PLUGINS" != "1" ]; then
  kop "Klaar. Sluit Claude Code helemaal af en start hem opnieuw."
  echo "Regel je plugins niet zelf via .claude/settings.json? Dan kun je de tien"
  echo "plugins er alsnog bij zetten met: bash installeer.sh --met-plugins"
  exit 0
fi

# --------------------------------------------------------------- plugins ----
kop "2. Plugins installeren"

CLAUDE=""
for kandidaat in "$(command -v claude 2>/dev/null)" "$HOME/.claude/local/claude" "/usr/local/bin/claude" "/opt/homebrew/bin/claude"; do
  [ -n "$kandidaat" ] && [ -x "$kandidaat" ] && { CLAUDE="$kandidaat"; break; }
done

# marketplace|plugin|waarvoor
PLUGINS=(
  "https://github.com/obra/superpowers-marketplace.git|superpowers-marketplace|superpowers|Werkwijzes: brainstormen, plannen, debuggen, code review"
  "https://github.com/obra/superpowers-marketplace.git|superpowers-marketplace|episodic-memory|Doorzoekt eerdere gesprekken"
  "https://github.com/obra/superpowers-marketplace.git|superpowers-marketplace|superpowers-chrome|Browserbediening vanuit Claude"
  "https://github.com/anthropics/claude-plugins-official.git|claude-plugins-official|frontend-design|Officiële designrichting van Anthropic"
  "https://github.com/anthropics/claude-plugins-official.git|claude-plugins-official|claude-code-setup|Adviseert hoe je Claude Code inricht"
  "ponytail/ponytail|ponytail|ponytail|Dwingt de simpelste oplossing af, tegen overbouwen"
  "thedotmack/claude-mem|thedotmack|claude-mem|Geheugen over sessies heen"
  "nowork-studio/notfair|nowork-studio|notfair|Google Ads, Meta Ads en SEO"
  "bradautomates/claude-video|claude-video|watch|Video's bekijken en samenvatten"
  "hex/claude-marketplace|hex-plugins|claude-council|Tweede mening van ChatGPT, Gemini en Grok (API-sleutels nodig)"
)

if [ -z "$CLAUDE" ]; then
  geel "   De 'claude' CLI is niet gevonden op dit systeem."
  geel "   Open Claude Code en plak deze regels één voor één in de terminal,"
  geel "   of gebruik het /plugin menu in Claude Code zelf:"
  echo
  gezien=""
  for regel in "${PLUGINS[@]}"; do
    IFS='|' read -r bron mkt plugin _ <<< "$regel"
    case "$gezien" in *"|$mkt|"*) ;; *) echo "   claude plugin marketplace add $bron"; gezien="$gezien|$mkt|" ;; esac
  done
  echo
  for regel in "${PLUGINS[@]}"; do
    IFS='|' read -r _ mkt plugin _ <<< "$regel"
    echo "   claude plugin install $plugin@$mkt"
  done
else
  gezien=""
  for regel in "${PLUGINS[@]}"; do
    IFS='|' read -r bron mkt plugin waarvoor <<< "$regel"
    case "$gezien" in
      *"|$mkt|"*) ;;
      *) "$CLAUDE" plugin marketplace add "$bron" >/dev/null 2>&1; gezien="$gezien|$mkt|" ;;
    esac
    if "$CLAUDE" plugin install "$plugin@$mkt" >/dev/null 2>&1; then
      groen "   ✓ $plugin — $waarvoor"
    else
      geel  "   ! $plugin overgeslagen (bestond al of installatie mislukt)"
    fi
  done
fi

# ---------------------------------------------------------------- gstack ----
kop "3. Optioneel: gstack (grote suite, ~1 GB)"
if [ -d "$HOME/.claude/skills/gstack" ]; then
  groen "   Staat er al."
else
  echo "   34 extra skills: browsertesten, QA, deployen, code review, iOS."
  echo "   Installeren met:"
  echo "   git clone --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack && cd ~/.claude/skills/gstack && ./setup"
fi

kop "Klaar. Start Claude Code opnieuw op, dan staan de skills erin."
echo "Lees INSTALLEREN.md voor wat er verder nog nodig is (API-sleutels, MCP-koppelingen)."
