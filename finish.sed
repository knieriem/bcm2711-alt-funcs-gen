# If a table line only has the ALT0 field set, with ALT1..5 being empty,
# delete the trailing empty string elements.
s/\(, ""\)\{5\}}/}/g
