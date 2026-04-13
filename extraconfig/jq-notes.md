notes for using `jq`

reference: [baeldung](https://www.baeldung.com/linux/jq-command-json)

print a field using period:
`jq .id`
iterate over an array with empty square brackets:
`jq '.[]'`
concatenate filters with pipe:
`jq '.[] | keys'`
`map` function applies filters or functions to an array:
`jq 'map(has("name"))'`
`select` returns items that match the specified condition:
`jq '.[] | select(.color=="yellow" and .price>=0.5)' fruits.json`

