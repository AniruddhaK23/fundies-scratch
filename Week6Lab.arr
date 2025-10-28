use context dcic2024
include data-source
include csv
include lists
student_score = load-table:
  Name :: String,
  Surname :: String,
  Email :: String,
  Score :: Number
  source: csv-table-file("students_gate_exam_score.csv",default-options)
  sanitize Score using num-sanitizer
  
end

students_score_ordered = order-by(student_score , 'Score',false)

no1 = students_score_ordered.row-n(0)
no2 = students_score_ordered.row-n(1)
no3 = students_score_ordered.row-n(2)
no1_list = [list: no1['Name'],no1['Surname'],no1['Score']]
no2_list = [list: no2['Name'],no2['Surname'],no2['Score']]
no3_list = [list: no3['Name'],no3['Surname'],no3['Score']]

data Student:
  | student(name :: String,surname :: String,score :: Number)
  
end
s1 = student('Ethan','Gray',97)
s2 = student('Oscar','Young',92)
s3 = student('Adrian','Bennet',80)
scores :: List<Number> = [list : s1.score , s2.score ,s3.score]

fun goat-scores(l :: List<Number>):
  cases(List)l :
    |empty => 0
    |link(f,r) =>
      if f >= 90:
        1 + goat-scores(r)
      else:
        goat-scores(r)
        
      end
  end
end

goat-scores(scores)

all-emails = student_score.get-column('Email')

fun get-domain(email :: String) block:
  temp1 = string-split(email,'@')
  temp2 = string-split(temp1.get(1),'.')
  temp2.get(0)
end
uni-domain = map(get-domain,all-emails)
    
distinct_uni-domain = distinct(uni-domain)

fun replace-domain(email :: String) block:
  temp1 = string-split(email,'@')
  username = temp1.get(0)
  domain = temp1.get(1)
  if domain == 'nulondon.ac.uk':
    username + '@northeastern.edu'
  else:
    username + domain
  end
end

all-emails-transformed = map(replace-domain,all-emails)