use context dcic2024
include csv
include data-source

#creating a table that captures different plants,their location and soil type and height and color 
plants = load-table:
  plant_common_name :: Number,
  location_latitude :: Number,
  location_longitude :: Number,
  date_sighted :: Date,
  soil_type :: String,
  plant_height_cm :: Number,
  plant_color :: String
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv" , default-options)
  sanitize location_latitude using num-sanitizer
  sanitize location_longitude using num-sanitizer
  sanitize plant_height_cm using num-sanitizer
end

plants.length()



#creating a table for data of patients with diabetes
medical = load-table:
  patient_no :: Number,
  glucose_level :: Number,
  date_time :: Date,
  insulin_dose :: Number,
  exercise_duration :: Number,
  stress_level ::  Number
  source: csv-table-file("glucose_levels.csv", default-options)
  sanitize patient_no using num-sanitizer
  sanitize glucose_level using num-sanitizer
  sanitize insulin_dose using num-sanitizer
  sanitize exercise_duration using num-sanitizer
  sanitize stress_level using num-sanitizer
end

lr-plot(medical, "stress_level","insulin_dose")
lr-plot(medical,"glucose_level","insulin_dose")
lr-plot(medical,"exercise_duration","stress_level")
lr-plot(medical,"stress_level","exercise_duration")
avg-glucose_level=mean(medical,"glucose_level")
median-exercise_duration=median(medical,"exercise_duration")
modes-insulin_dose= modes(medical,"insulin_dose")
all_num=medical.get-column("patient_no")

all-plant_common_name=plants.get-column("plant_common_name")