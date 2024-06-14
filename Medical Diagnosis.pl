symptom(sam,leg_pain).
symptom(john, cough).
symptom(jane, headache).
symptom(rosy, nausea).

disease(leg_pain,injury).
disease(cough, flu).
disease(headache, stress).
disease(nausea, food_poisoning).

diagnosis(Person, Disease) :-
    symptom(Person, Symptom),
    disease(Symptom, Disease).
