:-style_check(-singleton).
init():-convertir([]).
convertir(X):-write("Paciente:-"),read(Input), atomic_list_concat(L, ' ', Input),oracion(L,[],X).
%..................SINTOMAS...............................
gripesintomas([fiebre,tos,dolordegarganta]).
varicelasintomas([fiebre,manchas,picor]).
sarampionsintomas([rinitis,conjuntivitis,puntosblancos]).
sidasintomas([diarrea,fatiga,perdidadepeso]).
cancersintomas([abultamientoenlapiel,perdidadepeso,hemorragias]).
gripe([gripe]).
varicela([varicela]).
sarampion([sarampion]).
sida([sida]).
cancer([cancer]).

% ..................PREVENCION............................................
prevencion([gripe|S],S):- write("Lavarse las manos con frecuencia lo ayudará a protegerse contra los gérmenes. Si no hay agua y jabón, use un limpiador de manos a base de alcohol.
Limpie y desinfecte las superficies de contacto más comunes en el hogar, en el trabajo o en la escuela, especialmente cuando alguien está enfermo. Duerma bien, manténgase activo físicamente,controle su estrés, beba mucho líquido y coma alimentos nutritivos.\n")
,convertir([gripe]).

prevencion([varicela|S],S):-write("La mejor forma de prevenir la varicela es vacunándose contra esta enfermedad. Los niños, los adolescentes y los adultos deben recibir dos dosis de la vacuna contra la varicela. La vacuna contra la varicela es muy segura y eficaz para prevenir la enfermedad.\n"),convertir([varicela]).

prevencion([sarampion|S],S):-write("La vacunación es altamente efectiva en la prevención del sarampión, las vacunas que protegen de la enfermedad, son la vacuna triple viral (SRP) o la vacuna doble viral (SR).\n"),convertir([sarampion]).

prevencion([sida|S],S):-write("Tenga relaciones sexuales menos riesgosas. El VIH se propaga principalmente por tener sexo anal o vaginal sin condón o sin tomar los medicamentos para prevenir o tratar dicha infección.\n"),convertir([sida]).

prevencion([cancer|S],S):-write("Mantener un estilo de vida sano, evitar la exposición a sustancias que se sabe causan cáncer y vacunarse o tomar los medicamentos que pueden proteger para no padecer cáncer.\n"),convertir([cancer]).


%--------------------------------------CAUSAS------------------------

causas([gripe|S],S):-write("Causada por un virus en el organismo. Se transmite cuando las personas infectadas tosen, estornudan, o incluso cuando hablan cerca de otros.\n"),convertir([gripe]).
causas([varicela|S],S):-write("El virus que causa la varicela es el virus varicela zoster.\n"),convertir([varicela]).

causas([sarampion|S],S):-write("El Sarampión es causado por la infección con el virus del rubeola.\n"),convertir([sarampion]).

causas([sida|S],S):-write("El SIDA es consecuencia de la infección del virus de inmunodeficiencia humana (VIH). El VIH ataca y destruye las células del sistema inmunitario que luchan contra las enfermedades y deja el organismo indefenso ante las infecciones y el cáncer.\n"),convertir([sida]).

causas([cancer|S],S):-write("Factores genéticos, factores del estilo de vida tal como el tabaquismo, la alimenación y el ejercicio, factores sobre ciertos tipos de infecciones y factores relacionados con el entrono como la exposición a ciertas sustancias químicas y radiaciones.\n"),convertir([cancer]).


% -------------------------------------TRATAMIENTO------------------------

tratamiento([gripe|S],S):-write("Una pastillas de paracetamól cada 8 horas\n"),convertir([gripe]).
tratamiento([varicela|S],S):-write("Lociones para aliviar la picazón, paracetamol para la fiebre\n"),convertir([varicela]).

tratamiento([sarampion|S],S):-write("Administración de antitérmicos para la fiebre y antitusígenos para la tos.\n"),convertir([sarampion]).

tratamiento([sida|S],S):-write("Fármacos antirretrovirales, cuya finalidad es impedir que se multiplique el virus. Consigue reducir el número de partículas de VIH en la sangre, y permite que el conteo de CD4 permanezca alto, lo que conduce a mejorar y prolongar la vida del paciente. Aunque hay que tener presente que el paciente puede seguir transmitiendo el virus.\n"),convertir([sida]).

tratamiento([cancer|S],S):-write("Quimioterapia ó radioterapia\n"),convertir([cancer]).


%---------------------------ENFERMEDAD
enfermedad([gripe,varicela,sarampion,sida,cancer]).


obtenerCabeza([X|_],X).
longitud([],0).
longitud([_|R],N):-longitud(R,NN), N is NN+1.
esTres(X,Y):-X=Y.

buscarPalabra(Condicion,[]):- false,!.
buscarPalabra(Condicion,[Condicion|L]):-!.
buscarPalabra(Condicion,[C|L]):-buscarPalabra(Condicion,L).

esGripe([S0|S]):-gripesintomas(X),buscarPalabra(S0,X),esGripe(S).
esGripe([]):-write("DrLog:-"),write('Usted tiene gripe\n'),gripe(X),convertir(X),!.

esVaricela([S0|S]):-varicelasintomas(X),buscarPalabra(S0,X),esVaricela(S).
esVaricela([]):-write("DrLog:-"),write('Usted tiene varicela\n'),varicela(X),convertir(X),!.

esSida([S0|S]):-sidasintomas(X),buscarPalabra(S0,X),esSida(S).
esSida([]):-write("DrLog:-"),write('Usted tiene sida\n'),sida(X),convertir(X),!.

esSarampion([S0|S]):-sarampionsintomas(X),buscarPalabra(S0,X),esSarampion(S).
esSarampion([]):-write("DrLog:-"),write('Usted tiene sarampion\n'),sarampion(X),convertir(X),!.

esCancer([S0|S]):-cancersintomas(X),buscarPalabra(S0,X),esCancer(S).
esCancer([]):-write("DrLog:-"),write('Usted tiene cancer\n'),cancer(X),convertir(X),!.


agregarSintoma(Elemento,R,[Elemento|R]).

esEnfermedad(R):-esGripe(R);esVaricela(R);esSida(R);esSarampion(R);esCancer(R).

oracion(S0,S,S2):-esSaludo(S0,S,S2);
sintagma_nominal(S0,S1,S2),sintagma_verbal(S1,S,S2);
sintagma_verbal(S0,S1,S2),sintagma_nominal(S1,S,S2);
sintagma_nominal(S0,S,S2);
sintagma_verbal(S0,S,S2);
esPregunta(S0,S2);
esDespedida(S0,S),!;
noesnada(S2).
%..........................SINTAGMANOMINAL....................

sintagma_nominal(S0,S,S2):- sintoma(S0,S1,S2),sustantivo(S1,S,S2); sintoma(S0,S,S2).
%.........................SINTAGMAVERBAL......................

sintagma_verbal(S0,S,S2):- verbo(S0,S,S2).
sintagma_verbal(S0,S,S2):- verbo(S0,S1,S2),sintagma_nominal(S1,S,S2).
sintagma_verbal(S0,S,S2):-determinante(S0,S1,S2),verbo(S1,S,S2).



esSaludo(S0,S,S2):-saludo(S0,S1,S2),sustantivo(S1,S,S2);sustantivo(S0,S1,S2),saludo(S1,S,S2).
esDespedida(S0,S):-despedida(S0,S1),sustantivo(S1,S,S2);sustantivo(S0,S1,S2),despedida(S1,S).
esPregunta(S0,S2):-pregunta(S0,S2).

%.........................DETERMINANTE........................

determinante([el|S],S,S2).
determinante([la|S],S,S2).
determinante([los|S],S,S2).
determinante([las|S],S,S2).
determinante([he|S],S,S2).
determinante([de|S],S,S2).

pregunta([que|_],S2):-longitud(S2,N),esTres(3,N),esEnfermedad(S2),convertir(S2),!;
write("DrLog:-"),write('Requiero al menos 3 sintomas para dar algun diagnostico, cuenteme, que otro sintoma padece\n'),convertir(S2).
pregunta([cuales|_],S2):-write("DrLog:-"),write("Las causas de la enfermedad son: "),causas(S2,[]).
pregunta([como|_],S2):-write("DrLog:-"),write("Puede prevenirlo de la siguiente manera: "),prevencion(S2,[]).
pregunta([cual|_],S2):-write("DrLog:-"),write("El tratamiento recomendado es: "),tratamiento(S2,[]).

% .....................................SINTOMAS...........................


sintoma([fiebre|S],S,S2):-agregarSintoma(fiebre,S2,X),write("DrLog:-"),write("Cuentame más\n"),convertir(X).
sintoma([tos|S],S,S2):-agregarSintoma(tos,S2,X),write("DrLog:-"),write("Perfecto, que más tienes\n"),convertir(X).
sintoma([dolordegarganta|S],S,S2):-agregarSintoma(dolordegarganta,S2,X),write("DrLog:-"),write("¿Algún otro síntoma?\n"),convertir(X).
sintoma([manchas|S],S,S2):-agregarSintoma(manchas,S2,X),write("DrLog:-"),write("¿Que más siente?\n"),convertir(X).
sintoma([picor|S],S,S2):-agregarSintoma(picor,S2,X),write("DrLog:-"),write("Cuentame más\n"),convertir(X).
sintoma([rinitis|S],S,S2):-agregarSintoma(fiebre,S2,X),write("DrLog:-"),write("¿Que más siente?\n"),convertir(X).
sintoma([tos|S],S,S2):-agregarSintoma(tos,S2,X),write("DrLog:-"),write("Perfecto, que más tienes\n"),convertir(X).
sintoma([dolordegarganta|S],S,S2):-agregarSintoma(dolordegarganta,S2,X),write("DrLog:-"),write("Perfecto, que más tienes\n"),convertir(X).
sintoma([diarrea|S],S,S2):-agregarSintoma(diarrea,S2,X),write("DrLog:-"),write("Perfecto, que más tienes\n"),convertir(X).
sintoma([fatiga|S],S,S2):-agregarSintoma(fatiga,S2,X),write("DrLog:-"),write("Perfecto, que más tienes\n"),convertir(X).
sintoma([puntosblancos|S],S,S2):-agregarSintoma(puntosblancos,S2,X),write("DrLog:-"),write("Perfecto, que más tienes\n"),convertir(X).
sintoma([perdidadepeso|S],S,S2):-agregarSintoma(perdidadepeso,S2,X),write("DrLog:-"),write("Cuentame más\n"),convertir(X).
sintoma([conjuntivitis|S],S,S2):-agregarSintoma(conjuntivitis,S2,X),write("DrLog:-"),write("Perfecto, que más tienes\n"),convertir(X).
sintoma([hemorragias|S],S,S2):-agregarSintoma(hemorragias,S2,X),write("DrLog:-"),write("¿Algún otro síntoma?\n"),convertir(X).
sintoma([abultamientoenlapiel|S],S,S2):-agregarSintoma(abultamientoenlapiel,S2,X),write("DrLog:-"),write("¿Algún otro síntoma?\n"),convertir(X).


sustantivo([drLog|S],S,S2).
sustantivo([amigo|S],S,S2).
sustantivo([caballero|S],S,S2).
sustantivo([doc|S],S,S2).
sustantivo([sintomas|S],S,S2).
sustantivo([causas|S],S,S2).
sustantivo([prevenciones|S],S,S2).
sustantivo([tratamientos|S],S,S2).


% ..............................SALUDOS...............................

saludo([hola|S],S,S2):-write("DrLog:-"),write("Hola, en que puedo ayudarte\n"),convertir(S2).
saludo([buenosDias|S],S,S2):-write("DrLog:-"),write("Buenos dias, en que puedo ayudarte\n"),convertir(S2).
saludo([buenasTardes|S],S,S2):-write("DrLog:-"),write("Buenas tardes, en que puedo ayudarte\n"),convertir(S2).
saludo([buenasNoches|S],S,S2):-write("DrLog:-"),write("Buenas noches, en que puedo ayudarte\n"),convertir(S2).
%............................DESPEDIDAS...............................

despedida([adios|S],S):-write("DrLog:-"),write("Adios\n"),!.
despedida([gracias|S],S):-write("DrLog:-"),write("Con gusto,chao\n"),!.
despedida([muchasGracias|S],S):-write("DrLog:-"),write("Con mucho gusto,hastaluego\n"),!.
despedida([hastaLuego|S],S):-write("DrLog:-"),write("Con mucho gusto,hastaluego\n"),!.

% ........................................................................
% ........................................................................

noesnada(S2):-write("DrLog:-"), write('No entendi que quizo decir\n'),convertir(S2).

%..............................VERBOS.................................

verbo([tenido|S],S,S2).
verbo([tengo|S],S,S2).
verbo([sufro|S],S,S2).
verbo([tomar|S],S,S2).
verbo([siento|S],S,S2).
verbo([sufrido|S],S,S2).
verbo([siento|S],S,S2).
verbo([sientiendo|S],S,S2).
verbo([estado|S],S,S2).





% conjuncion([C|R],S2):-oracion(C,[],S2),obtenerCabeza(R,X),conjuncion(X,R);conjuncion(R,S2).

%conjuncion(y,[y|R],S2):-oracion(R,[],S2).
%conjuncion(y,[]):-false.
