alias dotenv="env \$(cat .env | xargs) "
alias miex="iex -S mix"
alias b64="cat | base64 -D"
alias toolbox="node ~/code/compose/toolbox/toolbox.js"

function woorden {
  # Download from https://www.opentaal.org/bestanden/file/2-woordenlijst-v-2-10g-bronbestanden
  cat ~/Documents/OpenTaal-210G-woordenlijsten/OpenTaal-210G-basis-gekeurd.txt |
    grep $1 |
    awk '{printf $0 " "}'
}
