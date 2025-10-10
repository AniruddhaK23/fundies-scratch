use context dcic2024
include csv
include data-source
voter-data =load-table:
  VoterID :: Number,
  DOB :: Date,
  Party :: String,
  Address :: String,
  City :: String,
  County :: String,
  Postcode :: String
  source: csv-table-file("voters.csv", default-options)
  sanitize VoterID using num-sanitizer
end

fun blank-to-undecided( str :: String)-> String:
  if str == "":
    "Undecided"
  else:
    str
  end
end

undecided-voter = transform-column(voter-data,"Party",blank-to-undecided)

fun normalize-date(str :: String)-> String:
  new_str = string-replace(str,'/','-')
  string-reverse(str)
end

normalized-date = transform-column(undecided-voter,"DOB",normalize-date)