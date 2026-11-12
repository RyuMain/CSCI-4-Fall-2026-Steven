def create_truth_table():
   
   
   for p in [True, False]:
        for q in [True, False]:
           for r in [True, False]:

              
              
                p_and_q = p and q
                

                equivalence = p_and_q == r
                

                print(f'{p} | {q} | {r} | {p_and_q} | {equivalence}')

create_truth_table()
